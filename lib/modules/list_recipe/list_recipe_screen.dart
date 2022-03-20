import 'package:flutter/material.dart';
import '../../index.dart';

class ListRecipeScreen extends GetView<ListRecipeController> {
  const ListRecipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: () async => false,
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: SafeArea(
            child: Scaffold(
              body: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      backgroundColor: Colors.transparent,
                      automaticallyImplyLeading: false,
                      pinned: false,
                      floating: true,
                      snap: true,
                      stretchTriggerOffset: 10.0,
                      forceElevated: innerBoxIsScrolled,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Column(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                              child: Container(
                                color: Colors.transparent,
                                child: TextField(
                                  textAlignVertical: TextAlignVertical.center,
                                  autofocus: false,
                                  // style: primaryTextStyle(),
                                  decoration: InputDecoration(
                                    filled: true,
                                    hintText: 'search'.tr,
                                    border: InputBorder.none,
                                    suffixIcon: const Icon(
                                      Icons.search,
                                      color: AppConfigs.appPrimaryColor,
                                    ),
                                    contentPadding: const EdgeInsets.only(
                                        left: 26.0,
                                        bottom: 8.0,
                                        top: 8.0,
                                        right: 50.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ];
                },
                body: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ListView.builder(
                    itemCount: controller.recipeModel.recipe.length,
                    itemBuilder: (BuildContext context, int index) {
                      return cardRecipe(
                          context, controller.recipeModel.recipe[index]);
                    },
                  ),
                ),
              ),
              bottomNavigationBar: BubbleBottomBar(
                opacity: .2,
                currentIndex: controller.currentIndex.value,
                backgroundColor: Theme.of(context).bottomAppBarColor,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                elevation: 8,
                onTap: controller.changeMenu,
                hasNotch: false,
                hasInk: true,
                items: <BubbleBottomBarItem>[
                  tab('Home', homeIconActive, homeIcon),
                  tab('User', userIconActive, userIcon),
                  tab('Bookmark', bookmarkIconActive, bookmarkIcon),
                  tab('Settings', settingsIconActive, settingsIcon),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget cardRecipe(BuildContext context, Recipe recipe) {
    return InkWell(
      onTap: () => controller.goDetailRecipe(recipe),
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: Get.height * 0.15,
            decoration: boxDecoration(
                bgColor: Theme.of(context).scaffoldBackgroundColor,
                radius: 10,
                showShadow: true),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: Get.width * 0.35,
                ),
                Container(
                  width: Get.width * 0.55,
                  height: Get.height * 0.15,
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
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
                            recipe.category,
                            style: const TextStyle(
                                color: AppConfigs.appPrimaryColor),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.share,
                              color: ColorConstants.cyan800,
                            ),
                          ),
                          const Icon(
                            Icons.add_circle_outline,
                            color: ColorConstants.cyan800,
                          ),
                        ],
                      ),
                      Flexible(
                        child: Text(
                          recipe.name,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 4.0),
                            child: Icon(
                              Icons.schedule,
                              color: ColorConstants.cyan800,
                            ),
                          ),
                          Text(recipe.duration),
                          const Spacer(),
                          const Icon(
                            Icons.egg_outlined,
                            color: ColorConstants.cyan800,
                          ),
                          Text(recipe.ingredients.length.toString() + ' Ing'),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: -4.0,
          left: -4.0,
          child: Hero(
            tag: recipe.image,
            child: Image.asset(
              recipe.image,
              fit: BoxFit.contain,
              width: Get.width * 0.35,
              height: Get.width * 0.35,
            ),
          ),
        ),
      ]),
    );
  }
}