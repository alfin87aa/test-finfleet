import 'package:flutter/material.dart';
import '../../index.dart';

class DetailRecipeScreen extends GetView<DetailRecipeController> {
  const DetailRecipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        backgroundColor: ColorConstants.orange200,
        body: SafeArea(
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back_ios_new)),
            ),
            Container(
              margin: EdgeInsets.only(top: Get.height * 0.1),
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              height: Get.height * 0.9,
              width: Get.width,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(32),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  shareFavoriteIcon(),
                  categoryWidget(),
                  nameWidget(),
                  durationIngCal(),
                ],
              ),
            ),
          ]),
        ),
      ),
      Positioned(
        top: -48.0,
        right: -48.0,
        child: Hero(
          tag: controller.recipe.image,
          child: Image.asset(
            controller.recipe.image,
            fit: BoxFit.contain,
            width: Get.width * 0.75,
            height: Get.width * 0.75,
          ),
        ),
      ),
    ]);
  }

  Widget shareFavoriteIcon() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 28.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.share,
              color: ColorConstants.cyan800,
            ),
          ),
          Icon(
            Icons.favorite,
            color: ColorConstants.cyan800,
          ),
        ],
      ),
    );
  }

  Widget categoryWidget() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 4,
            height: 16,
            margin: const EdgeInsets.only(right: 4),
            color: AppConfigs.appPrimaryColor,
          ),
          Text(
            controller.recipe.category,
            style: const TextStyle(color: AppConfigs.appPrimaryColor),
          ),
        ],
      ),
    );
  }

  Widget nameWidget() {
    return SizedBox(
      width: Get.width,
      child: Text(
        controller.recipe.name,
        textAlign: TextAlign.left,
        overflow: TextOverflow.clip,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
      ),
    );
  }

  Widget durationIngCal() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 4.0),
            child: Icon(
              Icons.schedule,
              color: ColorConstants.cyan800,
            ),
          ),
          Text(controller.recipe.duration),
          const Spacer(),
          const Icon(
            Icons.egg_outlined,
            color: ColorConstants.cyan800,
          ),
          Text(controller.recipe.ingredients.length.toString() + ' Ing'),
          const Spacer(),
          const Icon(
            Icons.local_fire_department_outlined,
            color: ColorConstants.cyan800,
          ),
          Text(controller.recipe.cal.toString() + ' cal'),
        ],
      ),
    );
  }
}
