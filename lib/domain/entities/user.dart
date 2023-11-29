import 'dart:convert';

class User {
  final String key;
  String username;
  String? picture;

  User({
    required this.key,
    required this.username,
    this.picture,
  });

  factory User.fromMap(Map<dynamic, dynamic> map, String key) {
    return User(
      key: key,
      username: map['username'],
      picture: map['picture'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'picture': picture,
    };
  }

  factory User.fromJson(String source, String key) =>
      User.fromMap(jsonDecode(source), key);

  String toJson() => jsonEncode(toMap());

  User copyWith({
    String? key,
    String? username,
    String? picture,
  }) {
    return User(
      key: key ?? this.key,
      username: username ?? this.username,
      picture: picture ?? this.picture,
    );
  }
}
