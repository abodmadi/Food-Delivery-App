import 'package:food_delivery_app/pages/food/popular_food_detail_page.dart';
import 'package:food_delivery_app/pages/food/recommended_food_detail_page.dart';
import 'package:food_delivery_app/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';

  static String getInitial() => '$initial';
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendedFood(int pageId) =>
      '$recommendedFood?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () {
        print('Navigate to Home Screen');
        return MainFoodPage();
      },
    ),
    GetPage(
      name: popularFood,
      page: () {
        print('Navigate to Populare Food Details Screen');
        String? pageId = Get.parameters['pageId'];
        return PopularFoodDetailPage(
          pageId: int.parse(pageId!),
        );
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        print('Navigate to Recommended Food Details Screen');
        String? pageId = Get.parameters['pageId'];
        return RecommendedFoodDetailPage(
          pageId: int.parse(pageId!),
        );
      },
      transition: Transition.fadeIn,
    ),
  ];
}
