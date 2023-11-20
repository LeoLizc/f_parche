import 'dart:convert';

class Friend {
  String key;
  String nickName;

  Friend({required this.key, required this.nickName});

  factory Friend.fromMap(Map<String, dynamic> map, String key) {
    return Friend(
      key: key,
      nickName: map['nickName'],
    );
  }

  factory Friend.fromJson(String json, String key) {
    Map<String, dynamic> map = jsonDecode(json);
    return Friend.fromMap(map, key);
  }

  Map<String, dynamic> toMap() {
    return {
      'nickName': nickName,
    };
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}
