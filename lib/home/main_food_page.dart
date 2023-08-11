import 'package:flutter/material.dart';
import 'package:food_delivery_app/home/food_page_body.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/widgets/custom_big_text.dart';
import 'package:food_delivery_app/widgets/custom_small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header 
            Container(
              child: Container(
                margin: EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                ),
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CustomBigText(
                          text: 'Egypt',
                          color: AppColors.mainColor,
                        ),
                        Row(
                          children: [
                            CustomSmallText(
                              text: '6 October',
                              color: Colors.black54,
                            ),
                            Icon(
                              Icons.arrow_drop_down_rounded,
                            )
                          ],
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Food Page Body
            FoodPageBody(),
          ],
        ),
      ),
    );
  }
}
