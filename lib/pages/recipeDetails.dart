import 'package:flutter/material.dart';
import 'package:projeto_mobile/models/recipe.dart';

class RecipeDetails extends StatelessWidget {
  final Recipe _recipe;
  RecipeDetails(this._recipe);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFB82121),
          title: Text(_recipe.title),
        ),
        backgroundColor: Color(0xFFB82121),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (_recipe.url != "")
                  ? Image.network(
                      _recipe.url,
                    )
                  : Icon(
                      Icons.no_photography_outlined,
                      size: 200,
                    ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      _recipe.title,
                      style: TextStyle(
                        fontSize: 50,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Feito por: ' + _recipe.author,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Descrição',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      _recipe.description,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Ingredientes',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      _recipe.ingredients,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Modo de preparo',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      _recipe.preparationMode,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
