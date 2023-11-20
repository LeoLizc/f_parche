import 'package:f_parche/domain/entities/chat.dart';

abstract class ChatRepository {
  Future<Chat> getChat(String id);
  Future<Chat> addChat(Chat chat);
}
