import 'dart:async';

import 'package:f_parche/domain/entities/message.dart';

abstract class MessagesRepository {
  Future<List<Message>> getMessagesList(String chatId);
  Future<Message> createMessage(String chatId, Message message);

  StreamSubscription<List<Message>> listenMessages(
    String chatId,
    void Function(List<Message>) onData,
  );

  StreamSubscription<Message?> listenNewMessage(
    String chatId,
    void Function(Message?) onData,
  );
}
