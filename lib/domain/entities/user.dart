import 'dart:convert';

class UserDetail {
  final String key;
  String username;
  String? picture;

  UserDetail({
    required this.key,
    required this.username,
    this.picture,
  });

  factory UserDetail.fromMap(Map<dynamic, dynamic> map, String key) {
    return UserDetail(
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

  factory UserDetail.fromJson(String source, String key) =>
      UserDetail.fromMap(jsonDecode(source), key);

  String toJson() => jsonEncode(toMap());

  UserDetail copyWith({
    String? key,
    String? username,
    String? picture,
  }) {
    return UserDetail(
      key: key ?? this.key,
      username: username ?? this.username,
      picture: picture ?? this.picture,
    );
  }
}
