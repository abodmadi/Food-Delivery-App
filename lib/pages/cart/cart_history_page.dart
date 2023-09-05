import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/custom_app_icon.dart';
import 'package:food_delivery_app/widgets/custom_big_text.dart';
import 'package:get/get.dart';

class CartHistoryPage extends StatelessWidget {
  const CartHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<CartModel> getItemsInCartHistory =
        Get.find<CartController>().getItemsInCartHistory();
    Map<String, int> cartItemsPreOrder = <String, int>{};

    for (var item in getItemsInCartHistory) {
      if (cartItemsPreOrder.containsKey(item.time!.split('.').first)) {
        cartItemsPreOrder.update(item.time!.split('.').first, (value) => ++value);
      } else {
        cartItemsPreOrder.putIfAbsent(item.time!.split('.').first, () => 1);
      }
    }

    //print(cartItemsPreOrder);
    //print(cartItemsPreOrder.length);

    List<int> cartOrderTimeToList() {
      return cartItemsPreOrder.entries.map((item) => item.value).toList();
    }

    List<int> cartOrderTimes = cartOrderTimeToList();
    //print(orderTimes);

    // ignore: unused_local_variable
    int listcounter = 0;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 130,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: Dimensions.height30 * 2),
            color: AppColors.mainColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomBigText(
                  text: 'Cart History',
                  fontSize: Dimensions.font24,
                  color: Colors.white,
                ),
                CustomAppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: AppColors.mainColor,
                  backColor: Colors.amberAccent,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                left: Dimensions.height20,
                right: Dimensions.height20,
                top: Dimensions.height20,
              ),
              child: ListView(
                children: [
                  for (int i = 0; i < cartOrderTimes.length; i++)
                    Container(
                      margin: EdgeInsets.only(bottom: Dimensions.height20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomBigText(text: '20/5/2022'),
                          Row(
                            children: [
                              Wrap(
                                direction: Axis.horizontal,
                                children:
                                    List.generate(cartOrderTimes[i], (index) {
                                  return Container(
                                    width: 50,
                                    height: 50,
                                    //color: Colors.amber,
                                    child: Text('Hi '),
                                  );
                                }),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
