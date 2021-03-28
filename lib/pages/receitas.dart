import 'package:flutter/material.dart';
import 'package:projeto_mobile/pages/adicionarReceita.dart';
import 'package:projeto_mobile/pages/cadastro.dart';
import 'package:projeto_mobile/pages/perfil.dart';

class Receitas extends StatefulWidget {
  Receitas({Key key}) : super(key: key);

  @override
  _ReceitasState createState() => _ReceitasState();
}

class _ReceitasState extends State<Receitas> {
  int index = 0;
  final List<Widget> _children = [
    // lista de receitas
    // receitas cadastradas
    // favorito
    Perfil(),
    AdicionarReceita(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[index],
      backgroundColor: Color(0xFFB82121),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        fixedColor: Colors.white,
        currentIndex: index, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color(0xFFFF5353),
            icon: new Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFFFF5353),
            icon: new Icon(Icons.book),
            label: 'Receitas',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFFFF5353),
            icon: Icon(Icons.favorite),
            label: 'Favorito',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFFFF5353),
            icon: new Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
