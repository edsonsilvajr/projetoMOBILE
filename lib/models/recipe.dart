class Recipe {
  int id;
  int authorid;
  String author;
  String title;
  String url;
  String description;
  String ingredients;
  String preparationMode;
  String category;

  Recipe({
    this.id,
    this.author,
    this.authorid,
    this.category,
    this.description,
    this.ingredients,
    this.preparationMode,
    this.title,
    this.url,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      author: json['author'],
      authorid: json['authorid'],
      category: json['category'],
      description: json['description'],
      ingredients: json['ingredients'],
      preparationMode: json['preparationMode'],
      title: json['title'],
      url: json['url'],
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    //return super.toString();
    return this.id.toString();
  }
}
