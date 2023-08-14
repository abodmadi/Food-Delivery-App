import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/custom_app_column.dart';
import 'package:food_delivery_app/widgets/custom_app_icon.dart';
import 'package:food_delivery_app/widgets/custom_big_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
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
                  image: AssetImage('assets/image/food0.png'),
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
                CustomAppIcon(
                  icon: Icons.arrow_back_ios,
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
                    text: 'Chinese Side',
                    fontSize: Dimensions.font24,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  CustomBigText(
                    text: 'Introduce',
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
          bottom: Dimensions.height30,
          top: Dimensions.height30,
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
                borderRadius: BorderRadius.circular(Dimensions.radiust20),
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
                borderRadius: BorderRadius.circular(Dimensions.radiust20),
                color: AppColors.mainColor,
              ),
              child: CustomBigText(
                text: '\$10 | Add to cart',
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
