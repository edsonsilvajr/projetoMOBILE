import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:projeto_mobile/models/user.dart';
import 'package:projeto_mobile/utils/variables.dart';

import '../models/recipe.dart';

class AppRepository extends ChangeNotifier {
  final List<Recipe> _recipes = [];
  final List<Recipe> _favorites = [];
  var jwt;

  UnmodifiableListView<Recipe> get recipes =>
      UnmodifiableListView(this._recipes);

  UnmodifiableListView<Recipe> get favorites =>
      UnmodifiableListView(this._favorites);

  Future login(email, password) async {
    var response;
    var res = await http.post(
      Uri.parse("$SERVER_IP/auth"),
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );
    response = jsonDecode(res.body);
    this.jwt = null;
    if (res.statusCode == 200) {
      this.jwt = 'Bearer ' + response['data']['token'];
    }

    return response;
  }

  void add(Recipe recipe) {
    _recipes.add(recipe);
    notifyListeners();
  }

  void addFav(Recipe recipe) {
    _favorites.add(recipe);
    notifyListeners();
  }

  void removeFav(Recipe recipe) {
    _favorites.remove(recipe);
    notifyListeners();
  }

  AppRepository() {
    _recipes.addAll([
      Recipe(
        id: 10,
        author: "Chef Zezinho",
        authorid: 15902,
        title: "FRITURA",
        url: "",
        description: "Um delecioso prato de frango com batata frita e salada",
        ingredients:
            "2x peda\u00e7os de frango, 1 pacote de batata frita, salada a gosto",
        preparationMode: "frita tudo e come",
        category: "Lanches",
      ),
      Recipe(
        id: 11,
        author: "Chef Joker",
        authorid: 985624,
        title: "RAMEN is Delicious",
        url:
            "https:\/\/i1.wp.com\/www.verdadefeminina.com.br\/wp-content\/uploads\/2019\/04\/ramen-comida-japonesa-e1555817633288.jpg",
        description: "RAMEN JAPONES",
        ingredients: "Ramen com vegetais",
        preparationMode: "Joga tudo no caldo Carnes, basta comer",
        category: "Massas",
      ),
      Recipe(
        id: 12,
        author: "Chef Joker",
        authorid: 985624,
        title: "HASH POTATOES + FRANGO",
        url:
            "https:\/\/i1.wp.com\/verdadefeminina.com.br\/wp-content\/uploads\/2019\/04\/comida-japonesa-o-que-comer-japao.jpg",
        description: "Batatas e frango",
        ingredients: "batata e frango",
        preparationMode: "frita batata, assa o frango, come",
        category: "Carnes",
      ),
    ]);
  }
}
