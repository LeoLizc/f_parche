import 'dart:convert';

class Location {
  String latitude;
  String longitude;
  String? address; // Make the address property nullable

  Location({
    required this.latitude,
    required this.longitude,
    this.address, // Update the constructor
  });

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      latitude: map['latitud'],
      longitude: map['longitud'],
      address: map['direccion'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'latitud': latitude,
      'longitud': longitude,
      'direccion': address,
    };
  }

  factory Location.fromJson(String json) => Location.fromMap(jsonDecode(json));

  String toJson() => jsonEncode(toMap());
}
