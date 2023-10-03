// ignore_for_file: must_be_immutable

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/custom_app_text_field.dart';
import 'package:food_delivery_app/widgets/custom_big_text.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  List<String> signUpOptionsImages = <String>[
    'f.png',
    'g.png',
    't.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // This showing Logo
              Container(
                height: Dimensions.screenHeight * 0.25,
                child: Center(
                  child: CircleAvatar(
                    radius: Dimensions.radius80,
                    foregroundColor: Colors.white,
                    backgroundImage:
                        const AssetImage('assets/image/logo part 1.png'),
                  ),
                ),
              ),
              // This showing email CustomAppTextField.
              CustomAppTextField(
                  hintText: 'Email',
                  textController: emailController,
                  prefixIcon: Icons.email),
              SizedBox(
                height: Dimensions.height10,
              ),
              // This showing password CustomAppTextField.
              CustomAppTextField(
                  hintText: 'Password',
                  textController: passwordController,
                  prefixIcon: Icons.password),
              SizedBox(
                height: Dimensions.height10,
              ),
              // This showing phone CustomAppTextField.
              CustomAppTextField(
                  hintText: 'Phone',
                  textController: phoneController,
                  prefixIcon: Icons.phone_android),
              SizedBox(
                height: Dimensions.height10,
              ),
              // This showing person CustomAppTextField.
              CustomAppTextField(
                  hintText: 'Name',
                  textController: nameController,
                  prefixIcon: Icons.person,
                  iconColor: Colors.grey),
              SizedBox(
                height: Dimensions.height20 + Dimensions.height20,
              ),
              // This showing sign-up button
              Container(
                width: Dimensions.screenWidth / 2,
                height: Dimensions.screenHeight / 13,
                //padding: EdgeInsets.only(left:Dimensions.height30,right:Dimensions.height30,bottom: Dimensions.height10,top: Dimensions.height10,),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                ),
                child: Center(
                  child: CustomBigText(
                    text: 'Sign Up',
                    fontSize: Dimensions.font20,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              // This showing the link to sign in.
              RichText(
                text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                  text: 'Have an account already?',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimensions.font15,
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              RichText(
                text: TextSpan(
                  text: 'Sign Up using one of the following methods: ',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimensions.font15,
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              Wrap(
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: EdgeInsets.only(top: Dimensions.height10,bottom: Dimensions.height10,left: Dimensions.height20,right: Dimensions.height20,),
                    child: CircleAvatar(
                      radius: Dimensions.radius20,
                      backgroundImage: AssetImage(
                          'assets/image/' + signUpOptionsImages[index]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
