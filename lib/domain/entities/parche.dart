import 'dart:convert';
import 'package:f_parche/domain/entities/location.dart';

class Member {
  String key;
  String username;
  String? avatar; // Make the avatar property nullable

  Member(
      {required this.key,
      required this.username,
      this.avatar}); // Update the constructor

  factory Member.fromMap(Map<String, dynamic> map, String key) {
    return Member(
      key: key,
      username: map['username'],
      avatar: map['avatar'],
    );
  }

  factory Member.fromJson(String json, String key) =>
      Member.fromMap(jsonDecode(json), key);

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'avatar': avatar,
    };
  }

  String toJson() => jsonEncode(toMap());
}

class Parche {
  String? key;
  List<Member> members; // Change the type to List<Member>
  String name;
  String description;
  String image;
  final String creator;
  final String creationDate;
  String meetingDate;
  Location location;

  Parche({
    this.key,
    this.members = const [],
    required this.name,
    required this.description,
    required this.image,
    required this.creator,
    creationDate,
    required this.meetingDate,
    required this.location,
  }) : creationDate = creationDate ?? DateTime.now().toString();

  factory Parche.fromMap(Map<String, dynamic> json, String key) {
    List<Member> members = [];
    json['miembros'].forEach((key, value) {
      members.add(Member.fromMap(value, key));
    });
    return Parche(
      key: key,
      members: members,
      name: json['nombre'],
      description: json['descripcion'],
      image: json['imagen'],
      creator: json['creador'],
      creationDate: json['fechaCreacion'],
      meetingDate: json['fechaEncuentro'],
      location: Location.fromMap(json['ubicacion']),
    );
  }

  factory Parche.fromJson(String json, String key) =>
      Parche.fromMap(jsonDecode(json), key);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> memberMaps = {};
    for (var member in members) {
      memberMaps[member.key] = member.toMap();
    }

    return {
      'members': memberMaps,
      'nombre': name,
      'descripcion': description,
      'imagen': image,
      'creador': creator,
      'fechaCreacion': creationDate,
      'fechaEncuentro': meetingDate,
      'ubicacion': location.toMap(),
    };
  }
}
