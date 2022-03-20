import '../index.dart';
part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.LIST,
      page: () => const ListRecipeScreen(),
      binding: ListRecipeBinding(),
    ),
    GetPage(
      name: Routes.DETAIL,
      page: () => const DetailRecipeScreen(),
      binding: DetailRecipeBinding(),
    )
  ];
}
