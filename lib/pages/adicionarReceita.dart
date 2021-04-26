import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:projeto_mobile/models/recipe.dart';
import 'package:projeto_mobile/repositories/app_repository.dart';
import 'package:projeto_mobile/widgets/button.dart';
import 'package:projeto_mobile/widgets/input.dart';
import 'package:provider/provider.dart';

class AdicionarReceita extends StatefulWidget {
  final Recipe recipe;
  AdicionarReceita({Key key, this.recipe}) : super(key: key);

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
  bool onlyOnce = false;

  @override
  Widget build(BuildContext context) {
    if (widget.recipe != null && !this.onlyOnce) {
      setState(() {
        this._titulo = widget.recipe.title;
        this._descricao = widget.recipe.description;
        this._ingredientes = widget.recipe.ingredients;
        this._preparo = widget.recipe.preparationMode;
        this._url = widget.recipe.url;
        this.onlyOnce = true;
      });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB82121),
        title: Text("Cadastro de Receita"),
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
                  margin: EdgeInsets.symmetric(vertical: 40),
                  child: Image.asset(
                    'assets/Logo.png',
                  ),
                ),
                Input(
                  initialValue:
                      widget.recipe != null ? widget.recipe.title : null,
                  textInput: 'Título da receita',
                  onSave: (String value) {
                    setState(() {
                      this._titulo = value;
                      print(this._titulo);
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
                  initialValue:
                      widget.recipe != null ? widget.recipe.description : null,
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
                  initialValue:
                      widget.recipe != null ? widget.recipe.ingredients : null,
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
                  initialValue: widget.recipe != null
                      ? widget.recipe.preparationMode
                      : null,
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
                  initialValue:
                      widget.recipe != null ? widget.recipe.url : null,
                  textInput: 'URL da imagem',
                  onSave: (String value) {
                    setState(() {
                      this._url = value;
                    });
                  },
                ),
                Consumer<AppRepository>(builder: (context, repository, child) {
                  return Button(
                    buttonLabel: 'Adicionar receita',
                    buttonIcon: Icons.add_box_outlined,
                    callback: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        if (this._titulo != null &&
                            this._descricao != null &&
                            this._ingredientes != null &&
                            this._preparo != null) {
                          print(this._titulo);
                          repository.createRecipe({
                            "title": this._titulo,
                            "url": this._url,
                            "description": this._descricao,
                            "ingredients": this._ingredientes,
                            "preparationMode": this._preparo,
                            "id":
                                widget.recipe != null ? widget.recipe.id : null,
                          }).then((res) => repository.getAll());

                          FocusScope.of(context).unfocus();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Receita cadastrada com sucesso'),
                            ),
                          );
                          Navigator.pop(context);
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
