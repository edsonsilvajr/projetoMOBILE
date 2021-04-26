// Atualmente não utilizado, será implementado para parte 2

import 'package:projeto_mobile/models/recipe.dart';

class User {
  int uid;
  String name;
  String type;
  String gender;
  String date;
  String email;
  List<String> favorites;
  String document;

  User({
    this.uid,
    this.name,
    this.document,
    this.date,
    this.email,
    this.type,
    this.gender,
    this.favorites,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: int.parse(json['uid']),
      name: json['name'],
      document: json['document'],
      date: json['date'],
      email: json['email'],
      type: json['type'],
      gender: json['gender'],
      favorites: List.from(json['favorites']),
    );
  }
}

//security storage - JWT
