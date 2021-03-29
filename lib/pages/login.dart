import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:projeto_mobile/pages/bottomBar.dart';

import '../widgets/input.dart';
import '../widgets/button.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB82121),
        title: Text("Login"),
        elevation: 0,
      ),
      backgroundColor: Color(0xFFB82121),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
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
                  onSave: (String value) {
                    setState(() {
                      this._email = value;
                    });
                  },
                  validationCallback: (String value) {
                    if (!EmailValidator.validate(value)) {
                      return 'Insira um email válido';
                    }
                    return null;
                  },
                ),
                Input(
                  textInput: 'Password',
                  onSave: (String value) {
                    setState(() {
                      this._password = value;
                    });
                  },
                  isPassword: true,
                  validationCallback: (String value) {
                    if (value.length < 6) {
                      return 'A senha deve ter pelo menos 6 caracteres';
                    }
                    return null;
                  },
                ),
                Button(
                  buttonLabel: 'Login',
                  buttonIcon: Icons.login,
                  callback: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      if (this._email == 'edsonsilvajr21@gmail.com' &&
                          this._password == '123123') {
                        FocusScope.of(context).unfocus();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Logando'),
                          duration: Duration(seconds: 1),
                        ));
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Receitas()),
                          (Route<dynamic> route) => false,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Usuário não encontrado'),
                        ));
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
