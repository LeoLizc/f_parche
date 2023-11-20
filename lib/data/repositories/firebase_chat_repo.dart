import 'package:f_parche/domain/entities/chat.dart';
import 'package:f_parche/domain/repositories/chat_repository.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseChatRepo implements ChatRepository {
  final _chatsCollection = FirebaseDatabase.instance.ref().child('chats');

  @override
  Future<Chat> addChat(Chat chat) async {
    final newChatRef = _chatsCollection.push();
    newChatRef.set(chat.toMap());
    return chat.copyWith(key: newChatRef.key);
  }

  @override
  Future<Chat?> getChat(String id) async {
    final chatEvent = await _chatsCollection.child(id).once();

    if (!chatEvent.snapshot.exists) {
      return null;
    }

    final chatMap = chatEvent.snapshot.value as Map<String, dynamic>;
    final chat = Chat.fromMap(chatMap, id);

    return chat;
  }
}
