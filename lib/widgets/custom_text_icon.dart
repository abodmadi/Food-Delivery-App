import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/custom_small_text.dart';

class CustomTextIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconColor;

  const CustomTextIcon({
    super.key,
    required this.text,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimensions.icon24,
        ),
        SizedBox(
          width: 3,
        ),
        CustomSmallText(
          text: text,
        ),
      ],
    );
  }
}
