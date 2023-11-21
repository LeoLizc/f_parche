import 'package:f_parche/ui/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatController chatController = Get.find();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Chats'),
        ),
        body: Obx(
          () => ListView.builder(
            itemCount: chatController.chatItems.length,
            itemBuilder: (context, index) {
              final chatItem = chatController.chatItems[index];
              return ChatItemWidget(
                name: chatItem.name,
                lastMessage: chatItem.lastMessage?.message ?? 'no hay mensajes',
                read: chatItem.read,
              );
            },
          ),
        ));
  }
}

class ChatItemWidget extends StatelessWidget {
  final String name;
  final String lastMessage;
  final String lastMessageTime;
  final bool read;

  const ChatItemWidget({
    super.key,
    required this.name,
    this.lastMessage = 'no hay mensajes',
    this.lastMessageTime = '10:30 AM',
    this.read = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 23,
        backgroundColor: Colors.blue,
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        lastMessage,
        style: const TextStyle(
          color: Colors.grey,
        ),
      ),
      trailing: Text(
        lastMessageTime,
        style: const TextStyle(
          color: Colors.grey,
        ),
      ),
      selected: read,
      onTap: () {},
    );
  }
}
