import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/custom_app_icon.dart';
import 'package:food_delivery_app/widgets/custom_big_text.dart';
import 'package:food_delivery_app/widgets/custom_small_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartHistoryPage extends StatelessWidget {
  const CartHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<CartModel> itemsInCartHistory =
        Get.find<CartController>().getItemsInCartHistory().reversed.toList();
    Map<String, int> cartItemsPreOrder = <String, int>{};

    for (var item in itemsInCartHistory) {
      if (cartItemsPreOrder.containsKey(item.time)) {
        cartItemsPreOrder.update(item.time!, (value) => ++value);
      } else {
        cartItemsPreOrder.putIfAbsent(item.time!, () => 1);
      }
    }

    //print(cartItemsPreOrder);
    //print(cartItemsPreOrder.length);

    List<int> cartOrderTimeToList() {
      return cartItemsPreOrder.entries.map((item) => item.value).toList();
    }

    List<int> preOrderTimes = cartOrderTimeToList();

    //print(orderTimes);
    // ignore: unused_local_variable

    int listcounter = -1;

    return Scaffold(
      body: Column(
        children: [
          // This showing history page AppBar
          Container(
            height: Dimensions.height10*13,
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
          // This showing List of items in cart history
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                left: Dimensions.height20,
                right: Dimensions.height20,
                top: Dimensions.height20,
              ),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(
                  children: [
                    for (int i = 0; i < preOrderTimes.length; i++)
                      // This showing order items represintation
                      Container(
                        height: Dimensions.height30*4,
                        //color: Colors.red,
                        margin: EdgeInsets.only(bottom: Dimensions.height20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (() {
                              DateFormat otuputFormat =
                                  DateFormat('MM/dd/yyyy hh:mm a');
                              DateTime orderDateTime = DateTime.parse(
                                  itemsInCartHistory[listcounter + 1].time!);
                              String outputDate =
                                  otuputFormat.format(orderDateTime);
                              return CustomBigText(
                                text: outputDate,
                                fontSize: Dimensions.font20,
                              );
                            }()),
                            // This Showing Date and Time of order
                            /*CustomBigText(
                              text: itemsInCartHistory[listcounter + 1].time!,
                              fontSize: Dimensions.font20,
                            ),*/
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // This is showing items images in order
                                Wrap(
                                  direction: Axis.horizontal,
                                  children:
                                      List.generate(preOrderTimes[i], (index) {
                                    if (listcounter <
                                        itemsInCartHistory.length) {
                                      listcounter++;
                                    }
                                    return preOrderTimes[i] > 3
                                        ? index < 2
                                            ? Container(
                                                margin: EdgeInsets.only(
                                                    right: Dimensions.height10 /
                                                        2),
                                                width: Dimensions.height20*4,
                                                height: Dimensions.height20*4,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Dimensions.radiust15 /
                                                              2),
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        AppConstants.BASE_URL +
                                                            AppConstants
                                                                .UPLOADS_URI +
                                                            itemsInCartHistory[
                                                                    listcounter]
                                                                .img!),
                                                  ),
                                                ),
                                              )
                                            : index == 2
                                                ? Stack(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            right: Dimensions
                                                                    .height10 /
                                                                2),
                                                        width: 80,
                                                        height: 80,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .circular(Dimensions
                                                                      .radiust15 /
                                                                  2),
                                                          image:
                                                              DecorationImage(
                                                            colorFilter:
                                                                ColorFilter
                                                                    .mode(
                                                              Colors.black
                                                                  .withOpacity(
                                                                      0.30),
                                                              BlendMode
                                                                  .multiply,
                                                            ),
                                                            fit: BoxFit.cover,
                                                            image: NetworkImage(AppConstants
                                                                    .BASE_URL +
                                                                AppConstants
                                                                    .UPLOADS_URI +
                                                                itemsInCartHistory[
                                                                        listcounter]
                                                                    .img!),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        right: Dimensions
                                                                .height10 *
                                                            1.6,
                                                        top: Dimensions
                                                                .height10 *
                                                            3,
                                                        child: Container(
                                                          child: Wrap(
                                                            //direction: Axis.vertical,
                                                            children:
                                                                List.generate(3,
                                                                    (index) {
                                                              return Icon(
                                                                Icons.circle,
                                                                color: Colors
                                                                    .black54,
                                                                size: 18,
                                                              );
                                                            }),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                : Container()
                                        : Container(
                                            margin: EdgeInsets.only(
                                                right: Dimensions.height10 / 2),
                                            width: Dimensions.height20*4,
                                            height: Dimensions.height20*4,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radiust15 / 2),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(AppConstants
                                                        .BASE_URL +
                                                    AppConstants.UPLOADS_URI +
                                                    itemsInCartHistory[
                                                            listcounter]
                                                        .img!),
                                              ),
                                            ),
                                          );
                                  }),
                                ),
                                // This is showing total items in order
                                Container(
                                  height: Dimensions.height20*4,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CustomSmallText(
                                        text: 'Total',
                                        color: AppColors.titleColor,
                                      ),
                                      CustomBigText(
                                        text: '${preOrderTimes[i]} Items',
                                        fontSize: Dimensions.font20,
                                        color: AppColors.titleColor,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radiust15 / 3),
                                          border: Border.all(
                                            width: 1,
                                            color: AppColors.mainColor,
                                          ),
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: Dimensions.height10,
                                              vertical:
                                                  Dimensions.height10 / 2),
                                          child: CustomSmallText(
                                            text: 'One more',
                                            color: AppColors.mainColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
          ),
        ],
      ),
    );
  }
}


/* items images order 
preOrderTimes[i] > 3
                                      ? List.generate(3, (index) {
                                          if (listcounter <
                                              itemsInCartHistory.length) {
                                            listcounter++;
                                          }
                                          if (index < 2) {
                                            return Container(
                                              margin: EdgeInsets.only(
                                                  right:
                                                      Dimensions.height10 / 2),
                                              width: 80,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.radiust15 /
                                                            2),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      AppConstants.BASE_URL +
                                                          AppConstants
                                                              .UPLOADS_URI +
                                                          itemsInCartHistory[
                                                                  listcounter]
                                                              .img!),
                                                ),
                                              ),
                                            );
                                          } else {
                                            return Stack(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right:
                                                          Dimensions.height10 /
                                                              2),
                                                  width: 80,
                                                  height: 80,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Dimensions
                                                                    .radiust15 /
                                                                2),
                                                    image: DecorationImage(
                                                      colorFilter:
                                                          ColorFilter.mode(
                                                        Colors.black
                                                            .withOpacity(0.30),
                                                        BlendMode.multiply,
                                                      ),
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                          AppConstants
                                                                  .BASE_URL +
                                                              AppConstants
                                                                  .UPLOADS_URI +
                                                              itemsInCartHistory[
                                                                      listcounter]
                                                                  .img!),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  right:
                                                      Dimensions.height10 * 1.6,
                                                  top: Dimensions.height10 * 3,
                                                  child: Container(
                                                    child: Wrap(
                                                      //direction: Axis.vertical,
                                                      children: List.generate(3,
                                                          (index) {
                                                        return Icon(
                                                          Icons.circle,
                                                          color: Colors.black54,
                                                          size: 18,
                                                        );
                                                      }),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            );
                                          }
                                        })
                                      : List.generate(preOrderTimes[i],
                                          (index) {
                                          if (listcounter <
                                              itemsInCartHistory.length) {
                                            listcounter++;
                                          }
                                          return Container(
                                            margin: EdgeInsets.only(
                                                right: Dimensions.height10 / 2),
                                            width: 80,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radiust15 / 2),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(AppConstants
                                                        .BASE_URL +
                                                    AppConstants.UPLOADS_URI +
                                                    itemsInCartHistory[
                                                            listcounter]
                                                        .img!),
                                              ),
                                            ),
                                          );
                                        })
 */