import 'package:flutter/material.dart';
import 'package:projeto_mobile/pages/cadastro.dart';
import 'package:projeto_mobile/pages/login.dart';
import 'package:projeto_mobile/widgets/button.dart';
import 'package:projeto_mobile/widgets/video_widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          VideoWidget(),
          Container(
            decoration: BoxDecoration(
              color: Color(0x91B82121),
            ),
            child: Center(
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
                      "Utilize o Random Kitchen e torne-se um verdadeiro Chef!",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Button(
                      buttonLabel: 'Entrar',
                      buttonIcon: Icons.login,
                      callback: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                    ),
                    Button(
                      buttonLabel: 'Cadastre-se',
                      buttonIcon: Icons.assignment_ind_outlined,
                      callback: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Cadastro()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
