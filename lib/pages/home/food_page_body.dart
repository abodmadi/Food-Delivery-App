import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/custom_app_column.dart';
import 'package:food_delivery_app/widgets/custom_big_text.dart';
import 'package:food_delivery_app/widgets/custom_small_text.dart';
import 'package:food_delivery_app/widgets/custom_text_icon.dart';

// ther is some problem in dynamic value (dimension device)

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(
    viewportFraction: 0.85,
  );
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        //print(_currPageValue.floor());
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Showing the Slider Item
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
            controller: pageController,
            itemBuilder: (context, index) {
              return _builtFoodBageItem(index);
            },
            itemCount: 5,
          ),
        ),
        // Showing the Dots Indecator
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue.floor(),
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        SizedBox(
          height: Dimensions.height30,
        ),
        // Showing the Popular Text
        Container(
          margin: EdgeInsets.only(
            left: Dimensions.wight20,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomBigText(
                text: 'Popular',
              ),
              SizedBox(
                width: Dimensions.wight10,
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 3,
                ),
                child: CustomBigText(
                  text: '.',
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimensions.wight10,
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 2,
                ),
                child: CustomSmallText(
                  text: 'Food pairing',
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: Dimensions.height30,
        ),
        // Showing the List of Food and Images
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(
                left: Dimensions.wight10,
                right: Dimensions.wight10,
                bottom: Dimensions.height10,
              ),
              child: Row(
                children: [
                  // Showing the Image Container
                  Container(
                    width: Dimensions.listViewImageSize,
                    height: Dimensions.listViewImageSize,
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius:
                          BorderRadius.circular(Dimensions.radiust20),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/image/food0.png'),
                      ),
                    ),
                  ),
                  // Showing the Text Container
                  Expanded(
                    child: Container(
                      height: Dimensions.listViewTextContSize,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radiust20),
                          bottomRight: Radius.circular(Dimensions.radiust20),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: Dimensions.wight10,
                          right: Dimensions.wight10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomBigText(
                              text: 'Nutritious fruit meal in China',
                            ),
                            SizedBox(
                              height: Dimensions.height5,
                            ),
                            CustomSmallText(
                              text: 'With chinese characteristics',
                            ),
                            SizedBox(
                              height: Dimensions.height5,
                            ),
                            // Custon Icon Text
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
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
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: 10,
        ),
        // Showing the ??
      ],
    );
  }

// Showing The Slider code
  Widget _builtFoodBageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);

      var carrTranslate = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, carrTranslate, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);

      var carrTranslate = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, carrTranslate, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index - 1) * (1 - _scaleFactor);

      var carrTranslate = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, carrTranslate, 0);
    } else {
      var currScale = 0.8;
      var carrTranslate = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, carrTranslate, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          // Meal Photo Container
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
              left: Dimensions.paddingLeft10,
              right: Dimensions.paddingRight10,
            ),
            decoration: BoxDecoration(
              color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
              borderRadius: BorderRadius.circular(Dimensions.radiust30),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/image/food0.png'),
              ),
            ),
          ),
          // Meal Details Text Container
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                left: Dimensions.merginLeft30,
                right: Dimensions.merginRight30,
                bottom: Dimensions.merginBottom30,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                //color: Colors.red,
                borderRadius: BorderRadius.circular(Dimensions.radiust20),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFE8E8E8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                  top: Dimensions.paddingTop5,
                  left: Dimensions.paddingLeft10,
                  right: Dimensions.paddingRight10,
                ),
                child:CustomAppColumn(text: 'Chinese Side',),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
