// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomBigText extends StatelessWidget {
  final String text;
  Color? color;
  double fontSize;
  TextOverflow overFlow;

  CustomBigText({
    Key? key,
    required this.text,
    this.color = const Color(0xFF332d2b),
    this.fontSize = 20,
    this.overFlow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
