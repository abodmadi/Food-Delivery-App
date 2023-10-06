import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

// ignore: must_be_immutable
class CustomAppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData prefixIcon;
  Widget? suffix;
  Color iconColor;
  bool isObscureText;
  CustomAppTextField({
    super.key,
    required this.hintText,
    required this.textController,
    required this.prefixIcon,
    this.iconColor = const Color(0xFF89dad0),
    this.isObscureText = false,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: Dimensions.height20,
        right: Dimensions.height20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.radius15),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            spreadRadius: 1,
            offset: const Offset(1, 1),
            color: Colors.grey.withOpacity(0.2),
          ),
        ],
      ),
      child: TextField(
        obscureText: isObscureText,
        controller: textController,
        decoration: InputDecoration(
          // This showing the hintText.
          hintText: hintText,
          // This showing the prefixIcon.
          prefixIcon: Icon(
            prefixIcon,
            color: iconColor,
          ),
          // This showing the suffix.
          suffix: suffix,
          // This showing the focusedBorder.
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius15),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 1.0,
            ),
          ),
          // This showing the enabledBorder.
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius15),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 1.0,
            ),
          ),
          // This showing the border.
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius15),
          ),
        ),
      ),
    );
  }
}
