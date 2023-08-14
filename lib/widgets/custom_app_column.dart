import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/custom_big_text.dart';
import 'package:food_delivery_app/widgets/custom_small_text.dart';
import 'package:food_delivery_app/widgets/custom_text_icon.dart';

class CustomAppColumn extends StatelessWidget {
  final String text;
  double fontSize;
  CustomAppColumn({
    super.key,
    required this.text,
    this.fontSize=0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomBigText(
          text: text,
          fontSize: fontSize,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Wrap Stars
            Wrap(
              children: List.generate(
                5,
                (index) =>
                    Icon(Icons.star, color: AppColors.mainColor, size: 15),
              ),
            ),
            SizedBox(
              width: Dimensions.wight10,
            ),
            // Some Texts
            CustomSmallText(
              text: '4.5',
            ),
            SizedBox(
              width: Dimensions.wight10,
            ),
            CustomSmallText(
              text: '1587',
            ),
            SizedBox(
              width: Dimensions.wight10,
            ),
            CustomSmallText(
              text: 'comments',
            ),
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        // Custon Icon Text
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextIcon(
              text: 'Normal',
              icon: Icons.circle_sharp,
              iconColor: Colors.orange,
            ),
            CustomTextIcon(
              text: '17km',
              icon: Icons.location_on,
              iconColor: AppColors.mainColor,
            ),
            CustomTextIcon(
              text: '37min',
              icon: Icons.access_time_rounded,
              iconColor: AppColors.iconColor2,
            ),
          ],
        ),
      ],
    );
  }
}
