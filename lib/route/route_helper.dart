import 'package:food_delivery_app/pages/cart/cart_page.dart';
import 'package:food_delivery_app/pages/food/popular_food_detail_page.dart';
import 'package:food_delivery_app/pages/food/recommended_food_detail_page.dart';
import 'package:food_delivery_app/pages/home/home_page.dart';
//import 'package:food_delivery_app/pages/home/main_food_page.dart';
import 'package:food_delivery_app/pages/splash/splash_screen.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splash = '/splash-screen';
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';
  static const String cart = '/cart';

  static String getSplashScreen() => '$splash';
  static String getInitial() => '$initial';
  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';
  static String getCart() => '$cart';

  static List<GetPage> routes = [
    GetPage(
        name: splash,
        page: () {
          return SplashScreen();
        }),
    GetPage(
      name: initial,
      page: () {
        print('Navigate to Home Screen');
        return HomePage();
      },
    ),
    GetPage(
      name: popularFood,
      page: () {
        print('Navigate to Populare Food Details Screen');
        String? pageId = Get.parameters['pageId'];
        String? page = Get.parameters['page'];
        return PopularFoodDetailPage(
          pageId: int.parse(pageId!),
          page: page!,
        );
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        print('Navigate to Recommended Food Details Screen');

        String? pageId = Get.parameters['pageId'];
        String? page = Get.parameters['page'];
        return RecommendedFoodDetailPage(
          pageId: int.parse(pageId!),
          page: page!,
        );
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: cart,
      page: () {
        print('Navigate to Cart Screen');
        return CartPage();
      },
      transition: Transition.fadeIn,
    ),
  ];
}
