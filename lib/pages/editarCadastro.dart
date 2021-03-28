import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:projeto_mobile/widgets/button.dart';
import 'package:projeto_mobile/widgets/input.dart';

class EditarCadastro extends StatefulWidget {
  EditarCadastro({Key key}) : super(key: key);

  @override
  _EditarCadastroState createState() => _EditarCadastroState();
}

class _EditarCadastroState extends State<EditarCadastro> {
  final _formKey = GlobalKey<FormState>();
  String _nome = '';
  String _email = '';
  String _password = '';
  String _passwordConfirm = '';
  int flag = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB82121),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Image.asset(
                    'assets/Logo.png',
                  ),
                ),
                Text(
                  "Nome ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Input(
                  textInput: 'Edson Silva Junior',
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
                Text(
                  "E-mail",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Input(
                  textInput: 'edsonsilvajr@gmail.com',
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
                SizedBox(
                  height: 25,
                ),
                Input(
                  textInput: 'Informe a senha',
                  onSave: (String value) {
                    setState(() {
                      this._password = value;
                    });
                  },
                  isPassword: true,
                  validationCallback: (String value) {
                    if (_password == null) {
                      return 'A senha é obrigatória';
                    } else if (value.length < 6) {
                      return 'A senha contém no mínimo 6 caracteres';
                    } else if (value == '123123') {
                      flag = 1;
                    } else {
                      flag = 0;
                    }
                    return null;
                  },
                ),
                Button(
                  buttonLabel: 'Confirmar alterações',
                  buttonIcon: Icons.check_box_outlined,
                  callback: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      print(flag);
                      if (flag == 0) {
                        FocusScope.of(context).unfocus();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Senha incorreta'),
                          ),
                        );
                      } else if (flag == 1) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                              'Suas informações foram alteradas com sucesso xd'),
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
