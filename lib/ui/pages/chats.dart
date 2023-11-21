import 'package:f_parche/domain/entities/chat.dart';
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
                chatItem: chatItem,
              );
            },
          ),
        ));
  }
}

class ChatItemWidget extends StatelessWidget {
  final ChatItem chatItem;

  const ChatItemWidget({
    super.key,
    required this.chatItem,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 23,
        backgroundColor: Colors.blue,
      ),
      title: Text(
        chatItem.name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        chatItem.lastMessage?.message ?? 'no hay mensajes',
        style: const TextStyle(
          color: Colors.grey,
        ),
      ),
      trailing: Text(
        chatItem.lastMessage?.date.toString() ?? '',
        style: const TextStyle(
          color: Colors.grey,
        ),
      ),
      selected: chatItem.read,
      onTap: () {},
    );
  }
}
