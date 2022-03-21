import 'package:flutter/material.dart';

import '../../index.dart';

class ListRecipeController extends GetxController {
  final RecipeModel recipeModel;

  ListRecipeController({
    required this.recipeModel,
  });
  RxInt currentIndex = 0.obs;
  RxList<Recipe> recipeList = <Recipe>[].obs;
  final searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    recipeList.addAll(recipeModel.recipe);
  }

  void changeMenu(int index) {
    currentIndex.value = index;
  }

  void goDetailRecipe(Recipe recipe) {
    Get.toNamed(Routes.DETAIL, arguments: {'recipe': recipe});
  }

  void searchRecipe(String query) {
    if (query.isNotEmpty) {
      List<Recipe> _recipeListData = <Recipe>[];

      for (var element in recipeModel.recipe) {
        if (element.name.toLowerCase().contains(query)) {
          _recipeListData.add(element);
        }
      }
      recipeList.clear();
      recipeList.addAll(_recipeListData);
    } else {
      recipeList.clear();
      recipeList.addAll(recipeModel.recipe);
    }
  }
}
