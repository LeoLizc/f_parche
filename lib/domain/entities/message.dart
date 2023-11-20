import 'dart:convert';

class MessagePreview {
  final String message;
  final DateTime date;
  final String author;

  MessagePreview({
    required this.message,
    required this.date,
    required this.author,
  });

  factory MessagePreview.fromMap(Map<String, dynamic> map) {
    return MessagePreview(
      message: map['message'],
      date: DateTime.parse(map['date']),
      author: map['author'],
    );
  }

  factory MessagePreview.fromJson(String json) {
    final map = jsonDecode(json);
    return MessagePreview.fromMap(map);
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'date': date.toIso8601String(),
      'author': author,
    };
  }

  String toJson() => jsonEncode(toMap());
}

class Message {
  final String? key;
  String message;
  final String sender;
  final String created;
  String edited;

  Message({
    this.key,
    required this.message,
    required this.sender,
    created,
    required this.edited,
  }) : created = created ?? DateTime.now().toIso8601String();

  factory Message.fromMap(Map<String, dynamic> map, String key) {
    return Message(
      key: key,
      message: map['message'],
      sender: map['sender'],
      created: map['created'],
      edited: map['edited'],
    );
  }

  factory Message.fromJson(String json, String key) =>
      Message.fromMap(jsonDecode(json), key);

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'sender': sender,
      'created': created,
      'edited': edited,
    };
  }

  String toJson() => jsonEncode(toMap());
}
