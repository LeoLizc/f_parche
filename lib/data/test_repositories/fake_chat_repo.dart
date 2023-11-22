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
          authorId: '1',
          author: 'Victor',
        ),
        Message(
          message: "Segundo mensaje",
          authorId: '2',
          author: 'Joel',
        ),
        Message(
          message: "Tercer mensaje",
          authorId: '1',
          author: 'Victor',
        ),
        Message(
          message:
              "Cuarto mensaje aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          authorId: '2',
          author: 'Joel',
        ),
      ],
    );
  }
}
