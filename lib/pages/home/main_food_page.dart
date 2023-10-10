import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/home/food_page_body.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/custom_big_text.dart';
import 'package:food_delivery_app/widgets/custom_small_text.dart';
import 'package:get/get.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  
  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }
  
  @override
  Widget build(BuildContext context) {
    //print('Cuurent height :' + MediaQuery.of(context).size.height.toString());
    //print('Cuurent Wight :' + MediaQuery.of(context).size.width.toString());
    return SafeArea(
      child: RefreshIndicator(
        color: Colors.white,
        backgroundColor: AppColors.mainColor,
        child: Column(
          children: [
            // Showing the Header
            Container(
              child: Container(
                margin: EdgeInsets.only(
                  top: Dimensions.marginTop20,
                  bottom: Dimensions.marginBottom20,
                ),
                padding: EdgeInsets.only(
                  left: Dimensions.paddingLeft20,
                  right: Dimensions.paddingRight20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CustomBigText(
                          text: 'Egypt',
                          color: AppColors.mainColor,
                        ),
                        Row(
                          children: [
                            CustomSmallText(
                              text: '6 October',
                              color: Colors.black54,
                            ),
                            Icon(
                              Icons.arrow_drop_down_rounded,
                            )
                          ],
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        width: Dimensions.wight45,
                        height: Dimensions.height45,
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(Dimensions.radius15),
                          ),
                        ),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: Dimensions.iconSize24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Showing the Food Page Body
            Expanded(
              child: SingleChildScrollView(
                child: FoodPageBody(),
              ),
            ),
            // Showing ??
          ],
        ),
        onRefresh: _loadResource,
      ),
    );
  }
}
