import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/models/product_model.dart';
import 'package:food_delivery_app/pages/home/main_food_page.dart';
import 'package:food_delivery_app/route/route_helper.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/custom_app_column.dart';
import 'package:food_delivery_app/widgets/custom_app_icon.dart';
import 'package:food_delivery_app/widgets/custom_big_text.dart';
import 'package:food_delivery_app/widgets/custom_expandable_text.dart';
import 'package:get/get.dart';

class PopularFoodDetailPage extends StatelessWidget {
  final int pageId;
  const PopularFoodDetailPage({
    super.key,
    required this.pageId,
  });

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        Get.find<PopularProductController>().popularProductList[pageId];
    return Scaffold(
      backgroundColor: Colors.white,
      // Showing the Stack
      body: Stack(
        children: [
          // Showing the Image Food
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: Dimensions.popularFoodImageSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOADS_URI+product.img!),
                ),
              ),
            ),
          ),
          // Showing the Icon Button
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.height20,
            right: Dimensions.height20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: CustomAppIcon(
                    icon: Icons.arrow_back_ios,
                  ),
                ),
                CustomAppIcon(
                  icon: Icons.shopping_cart_outlined,
                ),
              ],
            ),
          ),
          // Showing the Food Details
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImageSize - 30,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.height20,
                right: Dimensions.height20,
                top: Dimensions.height20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radiust20),
                  topRight: Radius.circular(Dimensions.radiust20),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppColumn(
                    text: product.name!,
                    fontSize: Dimensions.font24,
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  CustomBigText(
                    text: 'Introduce',
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  // Showing the Expandable Text
                  Expanded(
                    child: SingleChildScrollView(
                      child: CustomExpandableText(
                        text:product.description!,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Showing the ??
        ],
      ),
      // Showing the Button NavigationBar
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          bottom: Dimensions.height20,
          top: Dimensions.height20,
          left: Dimensions.height20,
          right: Dimensions.height20,
        ),
        height: Dimensions.popularFoodNavBarSize,
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radiust20 * 2),
            topRight: Radius.circular(Dimensions.radiust20 * 2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Showing the Add and Remove Item
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.height10,
                bottom: Dimensions.height10,
                right: Dimensions.height10,
                left: Dimensions.height10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radiust10),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: Dimensions.height10,
                  ),
                  CustomBigText(
                    text: '0',
                  ),
                  SizedBox(
                    width: Dimensions.height10,
                  ),
                  Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  ),
                ],
              ),
            ),
            // Showing the Total price Container
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.height10,
                bottom: Dimensions.height10,
                right: Dimensions.height10,
                left: Dimensions.height10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radiust10),
                color: AppColors.mainColor,
              ),
              child: CustomBigText(
                text: '\$${product.price!} | Add to cart',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      // Showing the ??
    );
  }
}
