// ignore_for_file: must_be_immutable
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/auth_controller.dart';
import 'package:food_delivery_app/models/sign_up_model.dart';
import 'package:food_delivery_app/pages/base/custom_loader.dart';
import 'package:food_delivery_app/pages/base/show_custom_snackbar.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/custom_app_text_field.dart';
import 'package:food_delivery_app/widgets/custom_big_text.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    List<String> signUpOptionsImages = <String>[
      'f.png',
      'g.png',
      't.png',
    ];

    void _registration(AuthController authController) {
      String name = nameController.text.trim();
      String email = emailController.text.trim();
      String phone = phoneController.text.trim();
      String password = passwordController.text.trim();

      if (name.isEmpty) {
        showCustomSnackBar('Type in your name', title: 'Name');
      } else if (email.isEmpty) {
        showCustomSnackBar('Type in your email address',
            title: 'Email address');
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar('Type in a valid email address',
            title: 'Valid email address');
      } else if (phone.isEmpty) {
        showCustomSnackBar('Type in your phone number', title: 'Phone number');
      } else if (password.isEmpty) {
        showCustomSnackBar('Type in your password', title: 'password');
      } else if (password.length < 6) {
        showCustomSnackBar('Password can not be less than six characters',
            title: 'Password length');
      } else {
        // post request
        SignUpModel signUpBody = SignUpModel(
          name: name,
          email: email,
          phone: phone,
          password: password,
        );
        authController.registration(signUpBody: signUpBody).then((status) {
          if (status.isSuccess) {
            showCustomSnackBar(
              'Registration done successfully',
              title: 'Register successfully',
              backColor: AppColors.mainColor,
            );
            print('Registration done successfully');
          } else {
            showCustomSnackBar(
              status.message,
              title: 'Register Failed',
            );
          }
        });
      }
    }

    return GetBuilder<AuthController>(
      builder: (authController) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: !authController.isLoaded
                ? SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        // This showing Logo
                        Container(
                          //height: Dimensions.screenHeight * 0.25,
                          //color: Colors.amber,
                          child: Center(
                            child: CircleAvatar(
                              radius: Dimensions.radius80,
                              foregroundColor: Colors.white,
                              backgroundImage: const AssetImage(
                                  'assets/image/logo part 1.png'),
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
                          isObscureText: !authController.isVisible,
                          hintText: 'Password',
                          textController: passwordController,
                          prefixIcon: Icons.password,
                          suffix: GestureDetector(
                            onTap: () {
                              authController.visibleOrNotPassword();
                            },
                            child: Icon(
                              !authController.isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppColors.mainColor,
                            ),
                          ),
                        ),
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
                        GestureDetector(
                          onTap: () {
                            _registration(authController);
                          },
                          child: Container(
                            width: Dimensions.screenWidth / 2,
                            height: Dimensions.screenHeight / 13,
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius30),
                            ),
                            child: Center(
                              child: CustomBigText(
                                text: 'Sign Up',
                                fontSize: Dimensions.font20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height20 + 5,
                        ),
                        // This showing the link to sign in.
                        RichText(
                          text: TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.back(),
                            text: 'Have an account already?',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimensions.font15,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height30,
                        ),
                        // This showing the Sign Up methods.
                        RichText(
                          text: TextSpan(
                            text:
                                'Sign Up using one of the following methods: ',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimensions.font15,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height10 / 2,
                        ),
                        // This showing the Sign Up icon methods.
                        Wrap(
                          children: List.generate(
                            3,
                            (index) => Padding(
                              padding: EdgeInsets.only(
                                top: Dimensions.height10,
                                bottom: Dimensions.height10,
                                left: Dimensions.height20,
                                right: Dimensions.height20,
                              ),
                              child: CircleAvatar(
                                radius: Dimensions.radius20,
                                backgroundImage: AssetImage('assets/image/' +
                                    signUpOptionsImages[index]),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : const CustomLoader(),
          ),
        );
      },
    );
  }
}
