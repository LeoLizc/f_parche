import 'package:f_parche/domain/entities/chat.dart';
import 'package:f_parche/domain/entities/message.dart';
import 'package:f_parche/domain/use_cases/chat_usecases.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class ChatController extends GetxController {
  final ChatUseCases _chatUseCases;

  ChatController(this._chatUseCases);

  final RxList<ChatItem> _chatItems = <ChatItem>[].obs;
  List<ChatItem> get chatItems => _chatItems;

  late Chat _chat;
  final RxList<Message> _messages = <Message>[].obs;
  List<Message> get messages => _messages;

  @override
  void onInit() {
    logDebug('ChatController Init');

    _chatUseCases.getChatItems().then((value) => _chatItems.addAll(value));

    super.onInit();
  }

  void subscribeToChatItems() {
    return;
  }

  void getChat(String chatId) {
    _chatUseCases.getChat(chatId).then((value) {
      _chat = value!;
      _messages.addAll(_chat.messages);
      _chat.messages.clear();
    });
  }
}
