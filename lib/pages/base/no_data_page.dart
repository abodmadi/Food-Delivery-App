import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

class NoDataPage extends StatelessWidget {
  final String text;
  final String imagePath;
  const NoDataPage({
    super.key,
    required this.text,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            width: MediaQuery.of(context).size.width * 0.22,
            height: MediaQuery.of(context).size.height * 0.22,
            imagePath,
          ),
          SizedBox(
            height: Dimensions.height20,
          ),
          Text(text,style: TextStyle(
            fontSize: MediaQuery.of(context).size.height*0.0175,
            color: Theme.of(context).disabledColor,
          ),
          textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
