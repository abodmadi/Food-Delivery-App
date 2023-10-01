import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/custom_app_icon.dart';
import 'package:food_delivery_app/widgets/custom_big_text.dart';

// ignore: must_be_immutable
class CustomAccountCardInfo extends StatelessWidget {
  final String info;
  final IconData icon;
  Color backColor;
  // ignore: use_key_in_widget_constructors
  CustomAccountCardInfo({
    Key? key,
    required this.info,
    required this.icon,
    this.backColor = const Color(0xFF89dad0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Dimensions.height20,
        top: Dimensions.height20,
        bottom: Dimensions.height20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            offset: const Offset(0, 2),
            color: Colors.grey.withOpacity(0.2),
          ),
        ],
      ),
      child: Row(
        children: [
          CustomAppIcon(
            icon: icon,
            backColor: backColor,
            iconColor: Colors.white,
            iconSize: Dimensions.iconSize24 + 1,
            size: Dimensions.height10 * 5,
          ),
          SizedBox(
            width: Dimensions.height20,
          ),
          CustomBigText(text: info),
        ],
      ),
    );
  }
}
