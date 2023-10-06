import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/custom_app_text_field.dart';
import 'package:food_delivery_app/widgets/custom_big_text.dart';
import 'package:get/get.dart';

import 'sign_up_page.dart';

// ignore: must_be_immutable
class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // This showing the Logo
              Container(
                height: Dimensions.screenHeight * 0.25,
                child: Center(
                  child: CircleAvatar(
                    backgroundImage:
                        const AssetImage('assets/image/logo part 1.png'),
                    radius: Dimensions.radius80,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
              // This showing the ??
              Container(
                margin: EdgeInsets.only(
                  left: Dimensions.height10,
                ),
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello..',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.font24 * 2,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Sign into your account',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: Dimensions.font15,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              // This showing the Email CustomAppTextField.
              CustomAppTextField(
                  hintText: 'Email',
                  textController: emailController,
                  prefixIcon: Icons.email),
              SizedBox(
                height: Dimensions.height10,
              ),
              // This showing password CustomAppTextField.
              CustomAppTextField(
                  isObscureText: true,
                  hintText: 'Password',
                  textController: passwordController,
                  prefixIcon: Icons.password),
              SizedBox(
                height: Dimensions.height20,
              ),

              // This showing the ??
              Row(
                children: [
                  Expanded(child: Container()),
                  RichText(
                    text: TextSpan(
                      text: 'Sign into your account',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: Dimensions.font20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.height10,
                  ),
                ],
              ),

              SizedBox(
                height: Dimensions.height30 * 2 - 10,
              ),

              // This showing Sign-in button
              Container(
                width: Dimensions.screenWidth / 2,
                height: Dimensions.screenHeight / 13,
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                ),
                child: Center(
                  child: CustomBigText(
                    text: 'Sign In',
                    fontSize: Dimensions.font20,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.height20 + 5,
              ),
              // This showing the link to Sign Up.
              RichText(
                text: TextSpan(
                  text: "Don't have an account?",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimensions.font20,
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(
                              () => SignUpPage(),
                              transition: Transition.fadeIn,
                            ),
                      text: ' Create.',
                      style: TextStyle(
                        color: AppColors.mainBlackColor,
                        fontSize: Dimensions.font20,
                      ),
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
