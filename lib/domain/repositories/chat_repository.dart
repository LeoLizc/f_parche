import 'package:f_parche/domain/entities/chat.dart';

abstract class ChatRepository {
  Chat getChat(String id);
  Chat addChat(Chat chat);
}
