import '../../index.dart';

class ListRecipeBinding extends Bindings {
  @override
  void dependencies() {
    LocalDataService _localData = Get.find();
    Get.lazyPut<ListRecipeController>(
        (() => ListRecipeController(recipeModel: _localData.recipeModel)));
  }
}
