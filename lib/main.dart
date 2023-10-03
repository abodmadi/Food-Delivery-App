import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/controllers/recommended_product_controller.dart';
//import 'package:food_delivery_app/pages/food/popular_food_detail_page.dart';
//import 'package:food_delivery_app/pages/food/recommended_food_detail_page.dart';
//import 'package:food_delivery_app/pages/home/food_page_body.dart';
//import 'package:food_delivery_app/pages/home/main_food_page.dart';
//import 'package:food_delivery_app/pages/splash/splash_screen.dart';
import 'package:food_delivery_app/route/route_helper.dart';
import 'package:get/get.dart';
//import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'helper/dependencies.dart' as dep;
import 'pages/auth/sign_in_page.dart';
import 'pages/auth/sign_up_page.dart';
//import 'pages/cart/cart_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getItemsInLocalStorage();
    //Get.find<CartController>().remove();
    //Get.find<CartController>().showeTime();
    return GetBuilder<PopularProductController>(
      builder: (_) {
        return GetBuilder<RecommendedProductController>(
          builder: (_) {
            return GetMaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
                useMaterial3: true,
              ),
              home: SignInPage(),
              //initialRoute: RouteHelper.getSplashScreen(),
              //getPages: RouteHelper.routes,
            );
          },
        );
      },
    );
  }
}
