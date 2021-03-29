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
}
