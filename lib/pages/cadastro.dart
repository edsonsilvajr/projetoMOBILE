import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:projeto_mobile/widgets/button.dart';
import 'package:projeto_mobile/widgets/input.dart';

class Cadastro extends StatefulWidget {
  Cadastro({Key key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();
  String _nome = '';
  String _email = '';
  String _password = '';
  String _passwordConfirm = '';
  int flag = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB82121),
        title: Text("Cadastro"),
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
                  textInput: 'Nome',
                  onSave: (String value) {
                    setState(() {
                      this._nome = value;
                    });
                  },
                  validationCallback: (String value) {
                    if (value.length < 3) {
                      return 'Nome é obrigatório e requer ao menos 3 letras';
                    }
                    return null;
                  },
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
                Input(
                  textInput: 'Confirm Password',
                  onSave: (String value) {
                    setState(() {
                      this._passwordConfirm = value;
                    });
                  },
                  isPassword: true,
                  validationCallback: (String value) {
                    if (this._password != this._passwordConfirm) {
                      flag = 1;
                    } else {
                      flag = 0;
                    }
                    return null;
                  },
                ),
                Button(
                  buttonLabel: 'Cadastrar',
                  buttonIcon: Icons.login,
                  callback: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      print(flag);
                      print(this._password);
                      if (flag == 0) {
                        FocusScope.of(context).unfocus();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Usuário cadastrado com sucesso!'),
                          ),
                        );
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('As senhas não correspondem'),
                        ));
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
