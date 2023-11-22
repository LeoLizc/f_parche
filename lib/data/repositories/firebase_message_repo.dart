import 'dart:async';

import 'package:f_parche/domain/entities/message.dart';
import 'package:f_parche/domain/repositories/messages_repository.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseMessageRepo implements MessagesRepository {
  final _chatsCollection = FirebaseDatabase.instance.ref().child('chats');

  @override
  Future<Message> createMessage(String chatId, Message message) async {
    final newMessageRef = _chatsCollection.child(chatId).push();
    newMessageRef.set(message.toMap());
    return message.copyWith(key: newMessageRef.key);
  }

  @override
  Future<List<Message>> getMessagesList(String chatId) async {
    final messagesRef = _chatsCollection.child('$chatId/messages');
    final messagesEvent = await messagesRef.once();

    if (!messagesEvent.snapshot.exists) {
      return [];
    }

    final messagesMap = messagesEvent.snapshot.value as Map<dynamic, dynamic>;
    final messages = messagesMap.entries
        .map((entry) =>
            Message.fromMap(entry.value as Map<dynamic, dynamic>, entry.key))
        .toList();

    return messages;
  }

  @override
  StreamSubscription<List<Message>> listenMessages(
      String chatId,
      void Function(
        List<Message> p1,
      ) onData,
      [int limit = 50]) {
    final messagesRef = _chatsCollection.child('$chatId/messages');
    final messagesSubscription =
        messagesRef.limitToLast(limit).onValue.map((event) {
      if (!event.snapshot.exists) {
        return <Message>[];
      }

      final messagesMap = event.snapshot.value as Map<dynamic, dynamic>;
      final messages = messagesMap.entries
          .map((entry) =>
              Message.fromMap(entry.value as Map<dynamic, dynamic>, entry.key))
          .toList();

      return messages;
    }).listen(onData);

    return messagesSubscription;
  }

  @override
  StreamSubscription<Message?> listenNewMessage(
    String chatId,
    void Function(Message? p1) onData,
  ) {
    final messagesRef = _chatsCollection.child('$chatId/messages');
    final messagesSubscription = messagesRef.onChildAdded.map((event) {
      if (!event.snapshot.exists) {
        return null;
      }

      return Message.fromMap(
          event.snapshot.value as Map<dynamic, dynamic>, event.snapshot.key!);
    }).listen(onData);

    return messagesSubscription;
  }
}
