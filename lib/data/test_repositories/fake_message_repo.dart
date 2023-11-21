import 'dart:async';

import 'package:f_parche/domain/entities/message.dart';
import 'package:f_parche/domain/repositories/messages_repository.dart';

class FakeMessageRepo implements MessagesRepository {
  StreamController<Message?> _newMessageStreamController =
      StreamController<Message?>.broadcast();

  @override
  Future<Message> createMessage(String chatId, Message message) {
    _newMessageStreamController.add(message);
    return Future.value(message);
  }

  @override
  Future<List<Message>> getMessagesList(String chatId) {
    // TODO: implement getMessagesList
    throw UnimplementedError();
  }

  @override
  StreamSubscription<List<Message>> listenMessages(
    String chatId,
    void Function(List<Message> p1) onData,
  ) {
    // TODO: implement listenMessages
    throw UnimplementedError();
  }

  @override
  StreamSubscription<Message?> listenNewMessage(
    String chatId,
    void Function(Message? p1) onData,
  ) {
    return _newMessageStreamController.stream.listen(onData);
  }
}
