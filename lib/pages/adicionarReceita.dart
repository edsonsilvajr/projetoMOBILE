import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:projeto_mobile/models/recipe.dart';
import 'package:projeto_mobile/repositories/recipes_repository.dart';
import 'package:projeto_mobile/widgets/button.dart';
import 'package:projeto_mobile/widgets/input.dart';
import 'package:provider/provider.dart';

class AdicionarReceita extends StatefulWidget {
  AdicionarReceita({Key key}) : super(key: key);

  @override
  _AdicionarReceitaState createState() => _AdicionarReceitaState();
}

class _AdicionarReceitaState extends State<AdicionarReceita> {
  final _formKey = GlobalKey<FormState>();
  String _titulo = '';
  String _descricao = '';
  String _ingredientes = '';
  String _preparo = '';
  String _url = '';

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
                  margin: EdgeInsets.symmetric(vertical: 40),
                  child: Image.asset(
                    'assets/Logo.png',
                  ),
                ),
                Input(
                  textInput: 'Título da receita',
                  onSave: (String value) {
                    setState(() {
                      this._titulo = value;
                    });
                  },
                  validationCallback: (String value) {
                    if (value.length < 3) {
                      return 'Nome da receita é obrigatório';
                    }
                    return null;
                  },
                ),
                Input(
                  textInput: 'Descrição',
                  onSave: (String value) {
                    setState(() {
                      this._descricao = value;
                    });
                  },
                  validationCallback: (String value) {
                    if (value.length < 10) {
                      return 'Descrição é obrigatório e requer no mínimo 10 letras';
                    }
                    return null;
                  },
                ),
                Input(
                  textInput: 'Ingredientes',
                  onSave: (String value) {
                    setState(() {
                      this._ingredientes = value;
                    });
                  },
                  validationCallback: (String value) {
                    if (value.length < 5) {
                      return 'Ingredientes é obrigatório';
                    }
                    return null;
                  },
                ),
                Input(
                  textInput: 'Modo de Preparo',
                  onSave: (String value) {
                    setState(() {
                      this._preparo = value;
                    });
                  },
                  validationCallback: (String value) {
                    if (value.length < 10) {
                      return 'Modo de preparo é obrigatório';
                    }
                  },
                ),
                Input(
                  textInput: 'URL da imagem',
                  onSave: (String value) {
                    setState(() {
                      this._preparo = value;
                    });
                  },
                ),
                Consumer<RecipesRepository>(
                    builder: (context, repository, child) {
                  Button(
                    buttonLabel: 'Adicionar receita',
                    buttonIcon: Icons.add_box_outlined,
                    callback: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        Recipe tosave = new Recipe(
                          id: 123,
                          author: 'salvinhu',
                          authorid: 156,
                          category: '',
                          description: _descricao,
                          ingredients: _ingredientes,
                          preparationMode: _preparo,
                          title: _titulo,
                          url: _url,
                        );
                        repository.add(tosave);
                        if (this._titulo != null &&
                            this._descricao != null &&
                            this._ingredientes != null &&
                            this._preparo != null) {
                          FocusScope.of(context).unfocus();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Receita cadastrada com sucesso'),
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red,
                          content:
                              Text('Campos necessários não foram preenchidos'),
                        ));
                      }
                    },
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
