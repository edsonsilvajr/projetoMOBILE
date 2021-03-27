import 'package:flutter/material.dart';
import 'package:projeto_mobile/widgets/button.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB82121),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 50),
                child: Image.asset(
                  'assets/Logo.png',
                ),
              ),
              Text(
                "Olá!",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              Text(
                "Cansou de alimentar-se mal?",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              Text(
                "Utilize o Random Kitchen e torne-se um verdade Chef!",
                style: TextStyle(color: Colors.white, fontSize: 17),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 80,
              ),
              Button(
                buttonLabel: 'Entrar',
                buttonIcon: Icons.login,
                callback: () {},
              ),
              Button(
                buttonLabel: 'Cadastre-se',
                buttonIcon: Icons.assignment_ind_outlined,
                callback: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
