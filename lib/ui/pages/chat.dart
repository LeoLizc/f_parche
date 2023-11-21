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

  @override
  void initState() {
    _chatController.getChat(widget.chatId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sala de Chat'),
        backgroundColor:
            const Color(0xFFFC6411), // Cambiar el color de la AppBar
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[300], // Color de fondo de la sala de chat
              child: ListView(
                padding: const EdgeInsets.all(10.0),
                children: const [
                  ChatMessage(message: 'Hola, ¿cómo estás?'),
                  ChatMessage(message: '¡Hola! Estoy bien, ¿y tú?'),
                  ChatMessage(message: 'Todo bien, gracias.'),
                  // Agregar más mensajes de chat
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            color: Colors.white, // Color de fondo del área de entrada de texto
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Escribe un mensaje...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: () {
                    // Agregar la lógica para enviar el mensaje
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
  final String message;

  const ChatMessage({super.key, required this.message});

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
              child: Text(message),
            ),
          ),
        ],
      ),
    );
  }
}
