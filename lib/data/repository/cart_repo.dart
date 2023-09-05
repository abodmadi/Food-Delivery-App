import 'dart:convert';

import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo extends GetxService {
  final SharedPreferences sharedPrefInstance;
  List<String> itemsInLocalStorageList = [];
  List<String> itemsInCartHistoryList = [];
  CartRepo({
    required this.sharedPrefInstance,
  });

  // This is showing Device Local Storage Operations

  void addItemsToLocalStorage(List<CartModel> totalItemsInCartList) {
    itemsInLocalStorageList = [];
    // Shared Preferences only accepts String or List of String, when you need to use it you must convert it.
    totalItemsInCartList.forEach((item) {
      item.time = DateTime.now().toString();
      itemsInLocalStorageList.add(jsonEncode(item));
    });
    sharedPrefInstance.setStringList(
        AppConstants.ITEMSINLOCALSTORAGELIST, itemsInLocalStorageList);
    getItemsInLocalStorage();
  }

  List<CartModel> getItemsInLocalStorage() {
    List<CartModel> itemsInLocalStorageList = [];
    if (sharedPrefInstance.containsKey(AppConstants.ITEMSINLOCALSTORAGELIST)) {
      sharedPrefInstance
          .getStringList(AppConstants.ITEMSINLOCALSTORAGELIST)!
          .forEach((item) {
        itemsInLocalStorageList.add(CartModel.fromJson(jsonDecode(item)));
      });
      for (var item in itemsInLocalStorageList) {
        print("Items in local storage: " + item.name!);
      }
      return itemsInLocalStorageList;
    } else {
      return itemsInLocalStorageList;
    }
  }

  // This is showing Cart History Operations

  void removeItemsInLocalStorage() {
    itemsInLocalStorageList.clear();
    sharedPrefInstance.remove(AppConstants.ITEMSINLOCALSTORAGELIST);
  }

  void addItemsToCartHistory() {
    //itemsInCartHistoryList = [];
    if (sharedPrefInstance.containsKey(AppConstants.ITEMSINCARTHISTORYLIST)) {
      itemsInCartHistoryList = sharedPrefInstance
          .getStringList(AppConstants.ITEMSINCARTHISTORYLIST)!;
    }
    for (var i = 0; i < itemsInLocalStorageList.length; i++) {
      itemsInCartHistoryList.add(itemsInLocalStorageList[i]);
    }
    for (var item in itemsInCartHistoryList) {
      print('Items in history list: ' + item);
    }
    removeItemsInLocalStorage();
    sharedPrefInstance.setStringList(
      AppConstants.ITEMSINCARTHISTORYLIST,
      itemsInCartHistoryList,
    );
    print('Cart history list lenght: ' +
        getItemsInCartHistory().length.toString());
  }

  List<CartModel> getItemsInCartHistory() {
    List<CartModel> itemsInCartHistoryList = [];
    if (sharedPrefInstance.containsKey(AppConstants.ITEMSINCARTHISTORYLIST)) {
      sharedPrefInstance
          .getStringList(AppConstants.ITEMSINCARTHISTORYLIST)!
          .forEach((item) {
        itemsInCartHistoryList.add(CartModel.fromJson(jsonDecode(item)));
      });
      return itemsInCartHistoryList;
    } else {
      return itemsInCartHistoryList;
    }
  }

  // This for test code
  void removeItems() {
    sharedPrefInstance.remove(AppConstants.ITEMSINLOCALSTORAGELIST);
    sharedPrefInstance.remove(AppConstants.ITEMSINCARTHISTORYLIST);
  }

  void showTime() {
    getItemsInCartHistory().forEach((item) {
      print('Item adding time: ' + item.time!);
    });
  }
}
