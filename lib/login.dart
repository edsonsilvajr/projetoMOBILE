import 'package:flutter/material.dart';

import './input.dart';
import './button.dart';

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
                child: Image.asset('assets/Logo.png'),
              ),
              Input('Email'),
              Input('Password'),
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
