import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

class CustomAppIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backColor;
  final double size;
  final double iconSize;
  //final double backSize;

  const CustomAppIcon({
    super.key,
    required this.icon,
    this.iconColor = const Color(0xFF756d54),
    this.backColor = const Color(0xFFfcf4e4),
    this.size = 40,
    this.iconSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: backColor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}
