import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/auth_controller.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/controllers/user_controller.dart';
import 'package:food_delivery_app/pages/base/custom_loader.dart';
import 'package:food_delivery_app/pages/base/show_custom_snackbar.dart';
import 'package:food_delivery_app/route/route_helper.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/custom_account_card_info.dart';
import 'package:food_delivery_app/widgets/custom_app_icon.dart';
import 'package:food_delivery_app/widgets/custom_big_text.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().isUserLoggedIn();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
      //print('User Logged in');
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          centerTitle: true,
          title: CustomBigText(
            text: 'Profile',
            fontSize: Dimensions.font20,
            color: Colors.white,
          ),
        ),
        // This Showing the user information.
        body: GetBuilder<UserController>(
          builder: (userController) {
            return _userLoggedIn
                ? (userController.isLoading
                    ? Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.only(top: Dimensions.height20),
                        child: Column(
                          children: [
                            // This showing the user image.
                            CustomAppIcon(
                              icon: Icons.person,
                              backColor: AppColors.mainColor,
                              iconColor: Colors.white,
                              iconSize: Dimensions.iconSize75,
                              size: Dimensions.radius150,
                            ),
                            SizedBox(
                              height: Dimensions.height30,
                            ),
                            Expanded(
                              child: ListView(
                                children: [
                                  // This showing the user name.
                                  CustomAccountCardInfo(
                                      info: userController.userModel.name!,
                                      icon: Icons.person),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  // This showing the user phone.
                                  CustomAccountCardInfo(
                                    info: userController.userModel.phone!,
                                    icon: Icons.phone,
                                    backColor: AppColors.yellowColor,
                                  ),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  // This showing the user mail.
                                  CustomAccountCardInfo(
                                    info: userController.userModel.email!,
                                    icon: Icons.email,
                                    backColor: AppColors.yellowColor,
                                  ),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  // This showing the user address.
                                  CustomAccountCardInfo(
                                    info: '6 October',
                                    icon: Icons.location_on,
                                    backColor: AppColors.yellowColor,
                                  ),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  // This showing the message.
                                  CustomAccountCardInfo(
                                      info: 'Hi,Abdullah',
                                      icon: Icons.message,
                                      backColor: Colors.redAccent),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                  // This showing the Logout.
                                  GestureDetector(
                                    onTap: () {
                                      if (Get.find<AuthController>()
                                          .isUserLoggedIn()) {
                                        /*if (Get.find<AuthController>().logOut()) {
                          }*/
                                        Get.find<AuthController>().logOut();
                                        Get.find<CartController>().clearItems();
                                        Get.find<CartController>()
                                            .clearCartHistory();
                                        showCustomSnackBar(
                                          'Logging out done successfully',
                                          title: 'Logging out',
                                          backColor: AppColors.mainColor,
                                        );
                                        Get.toNamed(RouteHelper.getSignIn());
                                      } else {
                                        showCustomSnackBar(
                                          'You are already logged out ',
                                          title: 'Warning',
                                          backColor: AppColors.yellowColor,
                                        );
                                      }
                                    },
                                    child: CustomAccountCardInfo(
                                        info: 'Logout',
                                        icon: Icons.logout,
                                        backColor: Colors.redAccent),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : CustomLoader())
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Center(
                          child: Container(
                            width: double.maxFinite,
                            height: Dimensions.height20 * 8,
                            margin: EdgeInsets.only(
                              left: Dimensions.height20,
                              right: Dimensions.height20,
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    'assets/image/signintocontinue.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.getSignIn());
                        },
                        child: Container(
                          child: Container(
                            width: double.maxFinite,
                            height: Dimensions.height20 * 4,
                            margin: EdgeInsets.only(
                              left: Dimensions.height20,
                              right: Dimensions.height20,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                            ),
                            child: Center(
                              child: CustomBigText(
                                text: 'Sign In',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
