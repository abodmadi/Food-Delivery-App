import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/custom_small_text.dart';

class CustomExpandableText extends StatefulWidget {
  final String text;
  const CustomExpandableText({
    super.key,
    required this.text,
  });

  @override
  State<CustomExpandableText> createState() => _CustomExpandableTextState();
}

class _CustomExpandableTextState extends State<CustomExpandableText> {
  late String firstHalf;
  late String sacoundHalf;
  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight / 7.81;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      sacoundHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      sacoundHalf = '';
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: sacoundHalf.isEmpty
          ? CustomSmallText(
              color: AppColors.paraColor,
              height: 1.5,
              fontSize: Dimensions.font15,
              text: firstHalf,
            )
          : Column(
              children: [
                CustomSmallText(
                    height: 1.5,
                    color: AppColors.paraColor,
                    fontSize: Dimensions.font15,
                    text: hiddenText
                        ? (firstHalf + '...')
                        : (firstHalf + sacoundHalf)),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      CustomSmallText(
                        text: 'Show more',
                        color: AppColors.mainColor,
                      ),
                      Icon(
                        hiddenText
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up,
                        color: AppColors.mainColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
