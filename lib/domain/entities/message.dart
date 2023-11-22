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
  final String authorId;
  final String author;
  final String created;
  String? edited;

  Message({
    this.key,
    required this.message,
    required this.authorId,
    required this.author,
    String? created,
    this.edited,
  }) : created = created ?? DateTime.now().toIso8601String();

  factory Message.fromMap(Map<String, dynamic> map, String key) {
    return Message(
      key: key,
      message: map['message'],
      authorId: map['authorId'],
      created: map['created'],
      edited: map['edited'],
      author: map['author'],
    );
  }

  factory Message.fromJson(String json, String key) =>
      Message.fromMap(jsonDecode(json), key);

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'authorId': authorId,
      'created': created,
      'edited': edited,
      'author': author,
    };
  }

  String toJson() => jsonEncode(toMap());

  Message copyWith({
    String? key,
    String? message,
    String? authorId,
    String? created,
    String? edited,
    String? author,
  }) {
    return Message(
      key: key ?? this.key,
      message: message ?? this.message,
      authorId: authorId ?? this.authorId,
      created: created ?? this.created,
      edited: edited ?? this.edited,
      author: author ?? this.author,
    );
  }
}
