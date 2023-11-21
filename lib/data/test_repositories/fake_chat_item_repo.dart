import 'dart:async';

import 'package:f_parche/domain/entities/chat.dart';
import 'package:f_parche/domain/repositories/chat_item_repository.dart';

class FakeChatItemRepo implements ChatItemRepository {
  @override
  Future<ChatItem> createChatItem(String userKey, ChatItem chatItem) {
    // -TODO: implement createChatItem
    throw UnimplementedError();
  }

  @override
  Future<List<ChatItem>> getChatItems(String userKey) async {
    return [
      ChatItem(
        parcheKey: 'sdsdsd1',
        lastMessage: null,
        read: false,
        name: 'Parche 1',
      ),
      ChatItem(
        parcheKey: 'sdsdsd2',
        lastMessage: null,
        read: false,
        name: 'Parche 2',
      ),
    ];
  }

  @override
  StreamSubscription<List<ChatItem>> listenChatItems(
      String userKey, void Function(List<ChatItem> p1) onUpdate) {
    // -TODO: implement listenChatItems
    throw UnimplementedError();
  }

  @override
  StreamSubscription<ChatItem?> listenNewChatItem(
      String userKey, void Function(ChatItem? p1) onUpdate) {
    // -TODO: implement listenNewChatItem
    throw UnimplementedError();
  }
}
