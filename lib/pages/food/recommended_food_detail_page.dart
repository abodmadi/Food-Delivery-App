import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
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
  final String page;
  const RecommendedFoodDetailPage({
    super.key,
    required this.pageId,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    CartController cart = Get.find<CartController>();
    Get.find<RecommendedProductController>().intiProduct(cart, product);
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
                      if (page == 'CartPage') {
                        Get.toNamed(RouteHelper.getCart());
                      } else {
                        Get.toNamed(RouteHelper.getInitial());
                      }
                    },
                    child: CustomAppIcon(
                      icon: Icons.close,
                    ),
                  ),
                  GetBuilder<RecommendedProductController>(
                    builder: (recommendedProduct) {
                      return GestureDetector(
                        onTap: () {
                          if (recommendedProduct.getTotalQuantityInCart() >=
                              1) {
                            Get.toNamed(RouteHelper.getCart());
                          }
                        },
                        child: Stack(
                          children: [
                            CustomAppIcon(
                              icon: Icons.shopping_cart_outlined,
                            ),
                            recommendedProduct.getTotalQuantityInCart() >= 1
                                ? Positioned(
                                    right: 0,
                                    top: 4,
                                    child: CustomAppIcon(
                                      icon: Icons.circle,
                                      iconColor: Colors.transparent,
                                      size: Dimensions.iconSize16,
                                      backColor: AppColors.mainColor,
                                    ),
                                  )
                                : Container(),
                            recommendedProduct.getTotalQuantityInCart() >= 1
                                ? Positioned(
                                    right: 3,
                                    top: 3,
                                    child: CustomSmallText(
                                      text: recommendedProduct
                                          .getTotalQuantityInCart()
                                          .toString(),
                                      color: Colors.white,
                                      //fontSize: Dimensions.font15,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      );
                    },
                  ),

                  /*GetBuilder<RecommendedProductController>(
                    builder: (recommendedProduct) {
                      return Stack(
                        children: [
                          CustomAppIcon(
                            icon: Icons.shopping_cart_outlined,
                          ),
                          recommendedProduct.getTotalItemInCart() >= 1
                              ? Positioned(
                                  top: 0,
                                  right: 0,
                                  child: CustomAppIcon(
                                    icon: Icons.circle,
                                    backColor: AppColors.mainColor,
                                    iconColor: Colors.transparent,
                                  ),
                                )
                              : Container(),
                          recommendedProduct.getTotalItemInCart() >= 1
                              ? Positioned(
                                  top: 0,
                                  right: 0,
                                  child: CustomSmallText(
                                    text: recommendedProduct
                                        .getTotalItemInCart()
                                        .toString(),
                                    color: Colors.white,
                                  ),
                                )
                              : Container(),
                        ],
                      );
                    },
                  ),*/
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
                  AppConstants.BASE_URL +
                      AppConstants.UPLOADS_URI +
                      product.img!,
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
                      text: product.description!,
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
        bottomNavigationBar: GetBuilder<RecommendedProductController>(
          builder: (recommendedProduct) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Showing the Icon Remove and Add to Cart
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
                      GestureDetector(
                        onTap: () {
                          recommendedProduct.setQuantity(false);
                        },
                        child: CustomAppIcon(
                          icon: Icons.remove,
                          backColor: AppColors.mainColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.iconSize24,
                        ),
                      ),
                      CustomBigText(
                        text:
                            '\$ ${product.price}  X  ${recommendedProduct.inCartItems} ',
                        color: AppColors.mainBlackColor,
                        fontSize: Dimensions.font20,
                      ),
                      GestureDetector(
                        onTap: () {
                          recommendedProduct.setQuantity(true);
                        },
                        child: CustomAppIcon(
                          icon: Icons.add,
                          backColor: AppColors.mainColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.iconSize24,
                        ),
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
                      // Showing the Add and Remove Favorite Item
                      Container(
                        padding: EdgeInsets.only(
                          top: Dimensions.height10,
                          bottom: Dimensions.height10,
                          right: Dimensions.height10,
                          left: Dimensions.height10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radiust10),
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: AppColors.mainColor,
                        ),
                      ),
                      // Showing the Total price Container
                      GestureDetector(
                        onTap: () {
                          recommendedProduct.addItem(product);
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                            top: Dimensions.height10,
                            bottom: Dimensions.height10,
                            right: Dimensions.height10,
                            left: Dimensions.height10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radiust10),
                            color: AppColors.mainColor,
                          ),
                          child: CustomBigText(
                            text: '\$ ${product.price} | Add to cart',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        // Showing the ??
      ),
    );
  }
}
