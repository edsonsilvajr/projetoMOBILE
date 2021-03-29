import 'package:flutter/material.dart';
import 'package:projeto_mobile/models/recipe.dart';
import 'package:projeto_mobile/pages/recipeDetails.dart';
import 'package:projeto_mobile/repositories/recipes_repository.dart';
import 'package:provider/provider.dart';

class Favorites extends StatefulWidget {
  Favorites({Key key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB82121),
        title: Text('Receitas Favoritas'),
      ),
      body: Consumer<RecipesRepository>(
        builder: (context, repository, child) {
          return Theme(
            data: ThemeData(
              splashColor: Colors.black,
            ),
            child: (!(repository.favorites.length > 0))
                ? Container(
                    color: Color(0xDEB82121),
                    child: Center(
                      child: Text(
                        "Você não possui nenhuma receita favorita",
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
                      itemCount: repository.favorites.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(),
                      itemBuilder: (context, index) {
                        final List<Recipe> favorites = repository.favorites;
                        Recipe recipe = favorites[index];
                        bool isFavorite = repository.favorites.contains(recipe);
                        return ListTile(
                          title: Text(
                            favorites[index].title,
                            style: TextStyle(color: Colors.white),
                          ),
                          leading: (favorites[index].url != "")
                              ? Image.network(
                                  favorites[index].url,
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
                              Icons.close,
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
