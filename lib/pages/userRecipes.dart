import 'package:flutter/material.dart';
import 'package:projeto_mobile/models/recipe.dart';
import 'package:projeto_mobile/pages/recipeDetails.dart';
import 'package:projeto_mobile/repositories/recipes_repository.dart';
import 'package:provider/provider.dart';
import 'package:projeto_mobile/pages/adicionarReceita.dart';

class UserRecipes extends StatefulWidget {
  final Recipe recipe;
  UserRecipes({Key key, this.recipe}) : super(key: key);

  @override
  _UserRecipesState createState() => _UserRecipesState();
}

class _UserRecipesState extends State<UserRecipes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFFB82121),
          title: Text('Minhas Receitas'),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdicionarReceita()),
                  );
                }),
          ]),
      body: Consumer<RecipesRepository>(
        builder: (context, repository, child) {
          return Theme(
            data: ThemeData(
              splashColor: Colors.black,
            ),
            child: (!(repository.recipes.length > 0))
                ? Container(
                    color: Color(0xDEB82121),
                    child: Center(
                      child: Text(
                        "Você não possui receitas",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ))
                : Container(
                    color: Color(0xDEB82121),
                    child: ListView.separated(
                      padding: EdgeInsets.only(top: 10),
                      itemCount: repository.recipes.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(),
                      itemBuilder: (context, index) {
                        final List<Recipe> recipes = repository.recipes;
                        return ListTile(
                          title: Text(
                            recipes[index].title,
                            style: TextStyle(color: Colors.white),
                          ),
                          leading: (recipes[index].url != "")
                              ? Image.network(
                                  recipes[index].url,
                                  cacheWidth: 100,
                                  cacheHeight: 100,
                                )
                              : Container(
                                  padding: EdgeInsets.only(left: 20, right: 13),
                                  child: Icon(
                                    Icons.fastfood,
                                    color: Colors.white,
                                  ),
                                ),
                        );
                      },
                    ),
                  ),
          );
        },
      ),
    );
  }
}
