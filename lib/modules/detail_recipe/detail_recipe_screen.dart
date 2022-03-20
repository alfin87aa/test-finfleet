import 'package:flutter/material.dart';
import '../../index.dart';

class DetailRecipeScreen extends GetView<DetailRecipeController> {
  const DetailRecipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        backgroundColor: ColorConstants.orange200,
        body: widgetBody(context),
      ),
      Positioned(
        top: -48.0,
        right: -48.0,
        child: Hero(
          tag: controller.recipe.image,
          child: Image.asset(
            controller.recipe.image,
            fit: BoxFit.contain,
            width: Get.width * 0.65,
            height: Get.width * 0.65,
          ),
        ),
      ),
    ]);
  }

  Widget widgetBody(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 28.0),
          child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios_new)),
        ),
        Container(
          margin: EdgeInsets.only(top: Get.height * 0.1),
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            color: Theme.of(context).bottomAppBarColor,
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
              widgetTags(),
              widgetDescription(context),
              widgetIngredient(context),
              widgetStep(context),
            ],
          ),
        ),
      ]),
    );
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

  Widget widgetTags() {
    return SizedBox(
      width: Get.width,
      height: Get.height * 0.04,
      child: ListView.builder(
        itemCount: controller.recipe.tags.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: Get.height * 0.04,
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.only(right: 12.0),
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(8.0)),
              child: Text(controller.recipe.tags[index]));
        },
      ),
    );
  }

  Widget widgetDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: ReadMoreText(
        controller.recipe.description,
        trimLength: 100,
        textAlign: TextAlign.justify,
        moreStyle: Theme.of(context).textTheme.bodyLarge,
        lessStyle: Theme.of(context).textTheme.bodyLarge,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              height: 1.5,
            ),
      ),
    );
  }

  Widget widgetIngredient(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "ingredients (".tr +
              controller.recipe.ingredients.length.toString() +
              ")",
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: Get.width * 0.3,
          width: Get.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.recipe.ingredients.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: Get.width * 0.2,
                        width: Get.width * 0.2,
                        padding: const EdgeInsets.all(8.0),
                        // margin: const EdgeInsets.only(right: 12.0),
                        decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Image.asset(
                          controller.recipe.ingredients[index].image,
                          fit: BoxFit.contain,
                        )),
                    Text(
                      controller.recipe.ingredients[index].name,
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget widgetStep(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "let's make it step by step".tr,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: controller.recipe.steps.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: Get.width * 0.3,
              width: Get.width,
              decoration: boxDecoration(
                  bgColor: Theme.of(context).bottomAppBarColor,
                  radius: 10,
                  showShadow: true),
              child: Row(
                children: [
                  Image.asset(
                    controller.recipe.steps[index].image,
                    fit: BoxFit.fitHeight,
                    width: Get.width * 0.3,
                    height: Get.width * 0.3,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: Get.width * 0.46,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Step ' +
                                controller.recipe.steps[index].id.toString(),
                          ),
                          Text(
                            controller.recipe.steps[index].description,
                            maxLines: 3,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
