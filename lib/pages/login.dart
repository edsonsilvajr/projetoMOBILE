import 'package:flutter/material.dart';

import '../widgets/input.dart';
import '../widgets/button.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
              Input(
                textInput: 'Email',
              ),
              Input(
                textInput: 'Password',
                isPassword: true,
              ),
              Button(
                buttonLabel: 'Login',
                buttonIcon: Icons.login,
                callback: () => print('Edsu mama nózes pf'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
