import 'package:f_parche/domain/entities/message.dart';
import 'package:f_parche/ui/controllers/auth_controller.dart';
import 'package:f_parche/ui/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoomPage extends StatefulWidget {
  final String chatId;

  const ChatRoomPage({
    Key? key,
    required this.chatId,
  }) : super(key: key);

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  final ChatController _chatController = Get.find();
  final AuthController _authController = Get.find();
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    _chatController.initChat(widget.chatId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String userId = _authController.getCurrentUser()!.id;

    return Scaffold(
      appBar: AppBar(
          title: const Text('Sala de Chat'),
          backgroundColor: const Color(0xFFFC6411),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              _chatController.disposeListenMessages();
              Get.back();
            },
          )),
      body: Column(
        children: [
          Expanded(
            child: Container(
                color: Colors.grey[300], // Color de fondo de la sala de chat
                child: Obx(
                  () => ListView.builder(
                    itemCount: _chatController.messages.length,
                    padding: const EdgeInsets.all(10.0),
                    itemBuilder: (context, index) {
                      return ChatMessage(
                        message: _chatController.messages[index],
                        myUserId: userId,
                      );
                    },
                  ),
                )),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            color: Colors.white, // Color de fondo del área de entrada de texto
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      hintText: 'Escribe un mensaje...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (_textController.text.isNotEmpty) {
                      _chatController.sendMessage(
                        _textController.text,
                      );
                      _textController.clear();

                      FocusScope.of(context).unfocus();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final Message message;
  final String myUserId;

  const ChatMessage({
    super.key,
    required this.message,
    required this.myUserId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.blue, // Color del avatar
            radius: 20.0,
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              color: Colors.white, // Color del mensaje
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.authorId == myUserId ? 'Tú' : message.author,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(message.message),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
