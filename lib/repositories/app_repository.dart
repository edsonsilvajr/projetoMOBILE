import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:projeto_mobile/models/user.dart';
import 'package:projeto_mobile/utils/variables.dart';

import '../models/recipe.dart';

class AppRepository extends ChangeNotifier {
  final List<Recipe> _recipes = [];
  final List<Recipe> _myRecipes = [];
  final List<Recipe> _favorites = [];
  var storage = FlutterSecureStorage();
  User user;

  UnmodifiableListView<Recipe> get recipes =>
      UnmodifiableListView(this._recipes);

  UnmodifiableListView<Recipe> get favorites =>
      UnmodifiableListView(this._favorites);

  UnmodifiableListView<Recipe> get myRecipes =>
      UnmodifiableListView(this._myRecipes);

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
    if (res.statusCode == 200) {
      storage.write(key: "jwt", value: 'Bearer ' + response['data']['token']);
      this.user = User.fromJson(response['data']['user']);
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
    var index = -1;
    _favorites.asMap().forEach((i, element) {
      if (element.id == recipe.id) {
        index = i;
      }
    });
    if (index >= 0) _favorites.removeAt(index);
    notifyListeners();
  }

  getAllRecipes() async {
    var jwt = await storage.read(key: 'jwt');
    if (jwt != null) {
      var res = await http.get(
        Uri.parse("$SERVER_IP/recipe?getParam=2"),
        headers: {
          HttpHeaders.authorizationHeader: jwt,
        },
      );
      var res2 = jsonDecode(res.body);
      _recipes.clear();
      res2.forEach((e) => _recipes.add(Recipe.fromJson(e)));

      notifyListeners();
    }
  }

  getUserRecipes() async {
    var jwt = await storage.read(key: 'jwt');
    if (jwt != null) {
      var res = await http.get(
        Uri.parse(
            "$SERVER_IP/recipe?getParam=2&id=" + this.user.uid.toString()),
        headers: {
          HttpHeaders.authorizationHeader: jwt,
        },
      );
      var res2 = jsonDecode(res.body);
      _myRecipes.clear();
      res2.forEach((e) => _myRecipes.add(Recipe.fromJson(e)));

      notifyListeners();
    }
  }

  createRecipe(Map json) async {
    var jwt = await storage.read(key: 'jwt');
    if (jwt != null) {
      var response;
      var function = json['id'] != null ? http.put : http.post;
      var res = await function(
        Uri.parse("$SERVER_IP/recipe"),
        body: jsonEncode({
          "author": this.user.name,
          "authorid": this.user.uid,
          "description": json['description'],
          "id": json['id'],
          "ingredients": json['ingredients'],
          "preparationMode": json['preparationMode'],
          "title": json['title'],
          "url": json['url'],
        }),
        headers: {
          HttpHeaders.authorizationHeader: jwt,
        },
      );
      response = jsonDecode(res.body);
      return response;
    }
  }

  logOut() async {
    _recipes.clear();
    _favorites.clear();
    _myRecipes.clear();
    user = null;
    await storage.delete(key: "jwt");
  }

  saveUser(Map json) async {
    var res = await http.post(
      Uri.parse("$SERVER_IP/user"),
      body: jsonEncode({
        "email": json['email'],
        "document": "12039102",
        "date": "00/00/0000",
        "gender": "M",
        "name": json['name'],
        "password": json['password'],
        "type": "cozinheiro",
        "uid": null,
      }),
    );
    return res;
  }

  favoriteRecipe(bool action, Recipe recipe) async {
    var jwt = await storage.read(key: "jwt");
    if (jwt != null) {
      var res = await http.put(
        Uri.parse("$SERVER_IP/favorite?uid=" +
            this.user.uid.toString() +
            "&rid=" +
            recipe.id.toString()),
        headers: {
          HttpHeaders.authorizationHeader: jwt,
        },
      );
      return action ? removeFav(recipe) : addFav(recipe);
    }
  }

  deleteRecipe(Recipe json) async {
    var jwt = await storage.read(key: "jwt");
    if (jwt != null) {
      var res = await http.delete(
        Uri.parse(
          "$SERVER_IP/recipe?id=" + json.id.toString(),
        ),
        headers: {
          HttpHeaders.authorizationHeader: jwt,
        },
      );
      return res;
    }
  }

  getFavorites() async {
    var jwt = await storage.read(key: "jwt");
    if (jwt != null) {
      var res = await http.get(
        Uri.parse("$SERVER_IP/favorite?uid=" + this.user.uid.toString()),
        headers: {
          HttpHeaders.authorizationHeader: jwt,
        },
      );
      var res2 = jsonDecode(res.body);
      _favorites.clear();
      res2.forEach((e) => _favorites.add(Recipe.fromJson(e)));
    }
  }

  getAll() async {
    getFavorites();
    getAllRecipes();
    getUserRecipes();
    notifyListeners();
  }

  getJWT() async {
    return await storage.read(key: 'jwt');
  }

  AppRepository() {
    getAllRecipes();
  }
}
