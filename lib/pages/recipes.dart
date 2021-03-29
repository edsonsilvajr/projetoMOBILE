import 'package:flutter/material.dart';
import 'package:projeto_mobile/models/recipe.dart';
import 'package:projeto_mobile/pages/recipeDetails.dart';
import 'package:projeto_mobile/repositories/recipes_repository.dart';
import 'package:provider/provider.dart';

class Recipes extends StatefulWidget {
  @override
  _RecipesState createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  Set<Recipe> favoriteRecipes = Set<Recipe>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB82121),
        title: Text('Receitas'),
      ),
      body: Consumer<RecipesRepository>(
        builder: (context, repository, child) {
          return Theme(
            data: ThemeData(
              splashColor: Colors.black,
            ),
            child: Container(
              color: Color(0xDEB82121),
              child: ListView.separated(
                padding: EdgeInsets.only(top: 10),
                itemCount: repository.recipes.length,
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
                itemBuilder: (context, index) {
                  final List<Recipe> recipes = repository.recipes;
                  Recipe recipe = recipes[index];
                  bool isFavorite = repository.favorites.contains(recipe);
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
                    trailing: IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          isFavorite
                              ? repository.removeFav(recipe)
                              : repository.addFav(recipe);
                        });
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecipeDetails(recipe)),
                      );
                    },
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
