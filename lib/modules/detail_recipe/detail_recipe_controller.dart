import '../../index.dart';

class DetailRecipeController extends GetxController {
  late Recipe _recipe;
  Recipe get recipe => _recipe;

  @override
  void onInit() {
    super.onInit();

    _recipe = Get.arguments['recipe'];
  }
}
