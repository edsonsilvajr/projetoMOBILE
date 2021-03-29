import 'package:flutter/material.dart';
import 'package:projeto_mobile/pages/home.dart';
import 'package:projeto_mobile/repositories/recipes_repository.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => RecipesRepository(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Sansation',
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
