import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/route/route_helper.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/custom_app_icon.dart';
import 'package:food_delivery_app/widgets/custom_big_text.dart';
import 'package:food_delivery_app/widgets/custom_small_text.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Showing the Header icons
            Positioned(
              height: Dimensions.height20 * 3,
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
                      iconColor: Colors.white,
                      backColor: AppColors.mainColor,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.height20 * 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: CustomAppIcon(
                      icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backColor: AppColors.mainColor,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                  CustomAppIcon(
                    icon: Icons.shopping_cart_outlined,
                    iconColor: Colors.white,
                    backColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ],
              ),
            ),
            // Showing the Items and Quantity of it in Cart
            Positioned(
              right: Dimensions.height20,
              left: Dimensions.height20,
              top: Dimensions.height20 * 3,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(
                  top: Dimensions.height10,
                ),
                child: GetBuilder<CartController>(
                  builder: (cartController) {
                    var cartList = cartController.totalItemsInCart;
                    return ListView.builder(
                      itemCount: cartList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: double.maxFinite,
                          height: Dimensions.height20 * 5,
                          //color: Colors.black,
                          margin: EdgeInsets.only(
                            bottom: Dimensions.height10,
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // I stope Hear 
                                  //Get.toNamed(RouteHelper.getPopularFood(
                                  //    cartList[index].id!));
                                },
                                child: Container(
                                  width: Dimensions.height20 * 5,
                                  height: Dimensions.height20 * 5,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radiust20),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          AppConstants.BASE_URL +
                                              AppConstants.UPLOADS_URI +
                                              cartList[index].img!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Dimensions.height10,
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(
                                    left: Dimensions.height10,
                                    right: Dimensions.height10,
                                  ),
                                  height: Dimensions.height20 * 5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radiust20),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CustomBigText(
                                        text: cartList[index].name!,
                                        color: Colors.black54,
                                      ),
                                      CustomSmallText(text: 'spicy'),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomBigText(
                                              text:
                                                  '\$ ${cartList[index].price}',
                                              color: Colors.redAccent),
                                          Container(
                                            padding: EdgeInsets.only(
                                              top: Dimensions.height10,
                                              bottom: Dimensions.height10,
                                              right: Dimensions.height10,
                                              left: Dimensions.height10,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radiust10),
                                              color: Colors.white,
                                            ),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    cartController.addItem(
                                                        cartList[index]
                                                            .product!,
                                                        -1);
                                                  },
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: AppColors.signColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Dimensions.height10,
                                                ),
                                                CustomBigText(
                                                  text:
                                                      '${cartList[index].quantity}',
                                                ),
                                                SizedBox(
                                                  width: Dimensions.height10,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    cartController.addItem(
                                                        cartList[index]
                                                            .product!,
                                                        1);
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    color: AppColors.signColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}