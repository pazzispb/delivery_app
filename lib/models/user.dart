// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  final String? id;
  final String? name;
  final String? lastname;
  final String? email;
  final String? phone;
  final String? image;
  final String? password;
  final String? sessionToken;

  User({
    this.id,
    this.name,
    this.lastname,
    this.email,
    this.phone,
    this.image,
    this.password,
    this.sessionToken,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    lastname: json["lastname"],
    email: json["email"],
    phone: json["phone"],
    image: json["image"],
    password: json["password"],
    sessionToken: json["session_token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "lastname": lastname,
    "email": email,
    "phone": phone,
    "image": image,
    "password": password,
    "session_token": sessionToken,
  };
}
