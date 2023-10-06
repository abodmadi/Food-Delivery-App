import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/custom_big_text.dart';
import 'package:get/get.dart';

void showCustomSnackBar(
  String message, {
  bool isError = true,
  String title = 'Error',
  Color backColor = Colors.redAccent,
}) {
  Get.snackbar(
    title,
    message,
    titleText: CustomBigText(
      text: title,
      color: Colors.white,
    ),
    messageText: Text(
      message,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
    colorText: Colors.white,
    backgroundColor: backColor,
    snackPosition: SnackPosition.TOP,
  );
}
