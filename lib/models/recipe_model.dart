// To parse this JSON data, do
//
//     final recipeModel = recipeModelFromJson(jsonString);

import 'dart:convert';

RecipeModel recipeModelFromJson(String str) =>
    RecipeModel.fromJson(json.decode(str));

String recipeModelToJson(RecipeModel data) => json.encode(data.toJson());

class RecipeModel {
  RecipeModel({
    required this.recipe,
  });

  List<Recipe> recipe;

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        recipe:
            List<Recipe>.from(json["recipe"].map((x) => Recipe.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "recipe": List<dynamic>.from(recipe.map((x) => x.toJson())),
      };
}

class Recipe {
  Recipe({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.category,
    required this.duration,
    required this.cal,
    required this.tags,
    required this.ingredients,
    required this.steps,
  });

  int id;
  String name;
  String description;
  String image;
  String category;
  String duration;
  int cal;
  List<String> tags;
  List<Ingredient> ingredients;
  List<Step> steps;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        category: json["category"],
        duration: json["duration"],
        cal: json["cal"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        ingredients: List<Ingredient>.from(
            json["ingredients"].map((x) => Ingredient.fromJson(x))),
        steps: List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "category": category,
        "duration": duration,
        "cal": cal,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
        "steps": List<dynamic>.from(steps.map((x) => x.toJson())),
      };
}

class Ingredient {
  Ingredient({
    required this.name,
    required this.image,
  });

  String name;
  String image;

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
      };
}

class Step {
  Step({
    required this.id,
    required this.image,
    required this.description,
  });

  int id;
  String image;
  String description;

  factory Step.fromJson(Map<String, dynamic> json) => Step(
        id: json["id"],
        image: json["image"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "description": description,
      };
}
