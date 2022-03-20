import '../../index.dart';

class DetailRecipeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailRecipeController>((() => DetailRecipeController()));
  }
}
