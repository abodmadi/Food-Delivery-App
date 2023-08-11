// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomSmallText extends StatelessWidget {
  final String text;
  Color? color;
  double fontSize;
  double height;

  CustomSmallText({
    Key? key,
    required this.text,
    this.color = const Color(0xFFccc7c5),
    this.fontSize = 12,
    this.height=1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: 'Roboto',
        height: height,
      ),
    );
  }
}
