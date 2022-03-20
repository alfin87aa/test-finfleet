import '../index.dart';

class LocalDataService extends GetxService {
  late RecipeModel _recipeModel;
  RecipeModel get recipeModel => _recipeModel;

  Future<LocalDataService> init() async {
    final String response = await rootBundle.loadString(StorageConstants.data);
    _recipeModel = recipeModelFromJson(response);

    return this;
  }
}
