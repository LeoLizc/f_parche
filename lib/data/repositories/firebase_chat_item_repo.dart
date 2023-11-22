import 'dart:async';

import 'package:f_parche/domain/entities/chat.dart';
import 'package:f_parche/domain/repositories/chat_item_repository.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseChatItemRepo implements ChatItemRepository {
  final _chatItemsCollection =
      FirebaseDatabase.instance.ref().child('chatLists');

  @override
  Future<ChatItem> createChatItem(String userKey, ChatItem chatItem) async {
    final newChatItemRef = _chatItemsCollection.child(userKey).push();
    newChatItemRef.set(chatItem.toMap());
    return chatItem.copyWith(key: newChatItemRef.key);
  }

  @override
  Future<List<ChatItem>> getChatItems(String userKey) async {
    final chatItemsEvent = await _chatItemsCollection.child(userKey).once();

    if (!chatItemsEvent.snapshot.exists) {
      return [];
    }

    final chatItemsMap = chatItemsEvent.snapshot.value as Map<dynamic, dynamic>;
    final chatItems = chatItemsMap.entries
        .map((entry) => ChatItem.fromMap(entry.value, entry.key))
        .toList();

    return chatItems;
  }

  @override
  StreamSubscription<List<ChatItem>> listenChatItems(
    String userKey,
    void Function(List<ChatItem> p1) onUpdate,
  ) {
    final chatItemsStream = _chatItemsCollection.child(userKey).onValue;
    return chatItemsStream.map((event) {
      if (!event.snapshot.exists) {
        return <ChatItem>[];
      }

      final chatItemsMap = event.snapshot.value as Map<dynamic, dynamic>;
      final chatItems = chatItemsMap.entries
          .map((entry) => ChatItem.fromMap(entry.value, entry.key))
          .toList();

      return chatItems;
    }).listen(onUpdate);
  }

  @override
  StreamSubscription<ChatItem?> listenNewChatItem(
    String userKey,
    void Function(ChatItem? p1) onUpdate,
  ) {
    final newChatItemStream = _chatItemsCollection.child(userKey).onChildAdded;
    return newChatItemStream.map((event) {
      final chatItemMap = event.snapshot.value as Map<dynamic, dynamic>;

      if (chatItemMap.isEmpty) {
        return null;
      }

      return ChatItem.fromMap(chatItemMap, event.snapshot.key!);
    }).listen(onUpdate);
  }
}
