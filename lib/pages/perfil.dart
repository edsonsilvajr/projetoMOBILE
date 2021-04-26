import 'package:flutter/material.dart';
import 'package:projeto_mobile/pages/editarCadastro.dart';
import 'package:projeto_mobile/pages/home.dart';
import 'package:projeto_mobile/repositories/app_repository.dart';
import 'package:projeto_mobile/widgets/button.dart';
import 'package:provider/provider.dart';

import 'editarCadastro.dart';

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
        child: Consumer<AppRepository>(builder: (context, repository, child) {
          return SingleChildScrollView(
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
                  repository.user.name,
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
                  repository.user.email,
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Tipo",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  repository.user.type,
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                Consumer<AppRepository>(builder: (context, repository, child) {
                  return Column(
                    children: [
                      Button(
                        buttonLabel: 'Editar informações',
                        buttonIcon: Icons.edit,
                        callback: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditarCadastro()),
                          );
                        },
                      ),
                      Button(
                        buttonLabel: 'Logout',
                        buttonIcon: Icons.logout,
                        callback: () {
                          repository.logOut();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        },
                      ),
                    ],
                  );
                })
              ],
            ),
          );
        }),
      ),
    );
  }
}
