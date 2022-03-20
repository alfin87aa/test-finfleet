import '../../index.dart';

class ListRecipeController extends GetxController {
  final RecipeModel recipeModel;

  ListRecipeController({
    required this.recipeModel,
  });
  RxInt currentIndex = 0.obs;

  void changeMenu(int index) {
    currentIndex.value = index;
  }

  void goDetailRecipe(Recipe recipe) {
    Get.toNamed(Routes.DETAIL, arguments: {'recipe': recipe});
  }
}
