import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/recommended_product_controller.dart';
import 'package:food_delivery_app/models/product_model.dart';
import 'package:food_delivery_app/route/route_helper.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/custom_app_icon.dart';
import 'package:food_delivery_app/widgets/custom_big_text.dart';
import 'package:food_delivery_app/widgets/custom_expandable_text.dart';
import 'package:food_delivery_app/widgets/custom_small_text.dart';
import 'package:get/get.dart';

class RecommendedFoodDetailPage extends StatelessWidget {
  final int pageId;
  const RecommendedFoodDetailPage({
    super.key,
    required this.pageId,
  });

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            // Showing the SLiverAppBar
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: Dimensions.toolbarHeight80,
              // Showing the Title
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: CustomAppIcon(
                      icon: Icons.close,
                    ),
                  ),
                  CustomAppIcon(
                    icon: Icons.shopping_cart_outlined,
                  ),
                ],
              ),
              // Showing the PreferredSize
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(Dimensions.height30),
                child: Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height5,
                    bottom: Dimensions.height10,
                  ),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radiust30),
                      topRight: Radius.circular(Dimensions.radiust30),
                    ),
                  ),
                  child: Center(
                    child: CustomBigText(
                      text: product.name!,
                      fontSize: Dimensions.font20,
                    ),
                  ),
                ),
              ),
              // Showing the FlexibleSpaceBar
              backgroundColor: AppColors.yellowColor,
              pinned: true,
              expandedHeight: Dimensions.expandedHeigth300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  AppConstants.BASE_URL+AppConstants.UPLOADS_URI+product.img!,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Showing the SLiverToBoxAdapter
            SliverToBoxAdapter(
              child: Column(
                children: [
                  // Showing the Custom ExpendableText
                  Container(
                    margin: EdgeInsets.only(
                      left: Dimensions.height10,
                      right: Dimensions.height10,
                    ),
                    child: CustomExpandableText(
                      text:product.description!,
                    ),
                  ),
                  // Showing the ??
                ],
              ),
            ),
            // Showing the ??
          ],
        ),
        // Showing the bottomNavigationBar
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Showing the Icon Remove and Add
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.height10,
                bottom: Dimensions.height10,
                left: Dimensions.height20 * 2.5,
                right: Dimensions.height20 * 2.5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomAppIcon(
                    icon: Icons.remove,
                    backColor: AppColors.mainColor,
                    iconColor: Colors.white,
                    iconSize: Dimensions.iconSize24,
                  ),
                  CustomBigText(
                    text: '\$ ${product.price}  X  0 ',
                    color: AppColors.mainBlackColor,
                    fontSize: Dimensions.font20,
                  ),
                  CustomAppIcon(
                    icon: Icons.add,
                    backColor: AppColors.mainColor,
                    iconColor: Colors.white,
                    iconSize: Dimensions.iconSize24,
                  ),
                ],
              ),
            ),
            // Showing the Icon Favorate and Add to Cart
            Container(
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
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
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
                      text: '\$10 | Add to cart',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // Showing the ??
      ),
    );
  }
}
