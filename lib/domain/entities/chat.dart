import 'dart:convert';
import 'package:f_parche/domain/entities/message.dart';

class ChatItem {
  final String parcheKey;
  MessagePreview? lastMessage;
  bool read;

  ChatItem({
    required this.parcheKey,
    this.lastMessage,
    this.read = false,
  });

  factory ChatItem.fromMap(Map<String, dynamic> map, String parcheKey) {
    return ChatItem(
      parcheKey: parcheKey,
      lastMessage: map['lastMessage'] != null
          ? MessagePreview.fromMap(map['lastMessage'])
          : null,
      read: map['read'],
    );
  }

  factory ChatItem.fromJson(String json, String parcheKey) =>
      ChatItem.fromMap(jsonDecode(json), parcheKey);

  Map<String, dynamic> toMap() {
    return {
      'lastMessage': lastMessage != null ? lastMessage!.toMap() : null,
      'read': read,
    };
  }

  String toJson() => jsonEncode(toMap());
}

class Chat {
  final String parcheKey;
  String chatName;
  List<Message> messages;

  Chat({
    required this.parcheKey,
    required this.chatName,
    this.messages = const [],
  });

  factory Chat.fromMap(Map<String, dynamic> map, String id) {
    List<Message> messages = [];
    (map['messages'] as Map).forEach((key, value) {
      messages.add(Message.fromMap(value, key));
    });
    return Chat(
      parcheKey: id,
      chatName: map['chatName'],
      messages: messages,
    );
  }

  factory Chat.fromJson(String json, String id) =>
      Chat.fromMap(jsonDecode(json), id);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> messageMaps = {};
    for (var message in messages) {
      messageMaps[message.key!] = message.toMap();
    }
    return {
      'chatName': chatName,
      'messages': messageMaps,
    };
  }

  String toJson() => jsonEncode(toMap());
}
