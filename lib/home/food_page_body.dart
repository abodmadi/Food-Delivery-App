import 'package:flutter/material.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: PageView.builder(
        itemBuilder: (context, index) {
          return _builtFoodBageItem(index);
        },
        itemCount: 5,
      ),
    );
  }

  Widget _builtFoodBageItem(int index) {
    return Container(
      //height: 220,
      margin: EdgeInsets.only(
        left: 5,
        right: 5,
      ),
      decoration: BoxDecoration(
        color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/image/food1.png'),
        ),
      ),
    );
  }
}
