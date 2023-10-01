import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/custom_account_card_info.dart';
import 'package:food_delivery_app/widgets/custom_app_icon.dart';
import 'package:food_delivery_app/widgets/custom_big_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: Container(
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
                    CustomAccountCardInfo(info: 'Abdullah', icon: Icons.person),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    // This showing the user phone.
                    CustomAccountCardInfo(info: '01554827311', icon: Icons.phone,backColor: AppColors.yellowColor,),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    // This showing the user mail.
                    CustomAccountCardInfo(
                        info: 'Abdullah@gmail.com', icon: Icons.email,backColor: AppColors.yellowColor,),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    // This showing the user address.
                    CustomAccountCardInfo(
                        info: '6 October', icon: Icons.location_on,backColor: AppColors.yellowColor,),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    // This showing the message.
                    CustomAccountCardInfo(
                        info: 'Hi,Abdullah', icon: Icons.message,backColor: Colors.redAccent),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
