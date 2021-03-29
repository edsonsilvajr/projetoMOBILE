import 'package:flutter/material.dart';
import 'package:projeto_mobile/pages/home.dart';
import 'package:projeto_mobile/widgets/button.dart';

class Perfil extends StatefulWidget {
  Perfil({Key key}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB82121),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Image.asset(
                  'assets/Logo.png',
                ),
              ),
              Text(
                "Nome ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "Edson Silva Junior",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "E-mail ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "edsonsilvajr@gmail.com",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Senha ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "******",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              Button(
                buttonLabel: 'Editar informações',
                buttonIcon: Icons.edit,
                callback: () {},
              ),
              Button(
                buttonLabel: 'Logout',
                buttonIcon: Icons.logout,
                callback: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
