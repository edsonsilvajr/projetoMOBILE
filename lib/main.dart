import 'package:flutter/material.dart';
import 'package:projeto_mobile/pages/receitas.dart';
//import 'package:projeto_mobile/pages/cadastro.dart';
//import 'package:projeto_mobile/pages/home.dart';
//import 'pages/login.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Receitas(),
    );
  }
}
