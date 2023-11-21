import 'package:f_parche/domain/entities/chat.dart';
import 'package:f_parche/domain/entities/message.dart';
import 'package:f_parche/domain/repositories/chat_repository.dart';

class FakeChatRepo implements ChatRepository {
  @override
  Future<Chat> addChat(Chat chat) {
    // TODO: implement addChat
    throw UnimplementedError();
  }

  @override
  Future<Chat?> getChat(String id) async {
    return Chat(
      parcheKey: id,
      chatName: "miparche",
      messages: [
        Message(
          message: "Primer mensaje",
          sender: '1',
        ),
        Message(
          message: "Segundo mensaje",
          sender: '2',
        ),
        Message(
          message: "Tercer mensaje",
          sender: '1',
        ),
        Message(
          message: "Cuarto mensaje",
          sender: '2',
        ),
      ],
    );
  }
}
