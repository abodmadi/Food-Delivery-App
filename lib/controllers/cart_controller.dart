import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/repository/cart_repo.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/models/product_model.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;
  CartController({
    required this.cartRepo,
  });

  List<dynamic> cartList = [];

  List<CartModel> localStorageItems = [];

  void addItem(ProductModel product, int quantity) {
    late var totalQuantity;
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id!,
        (CartModel cartModel) {
          totalQuantity = cartModel.quantity! + quantity;
          cartModel.quantity = cartModel.quantity! + quantity;
          cartModel.product = product;
          cartModel.time = DateTime.now().toString().split('.').first;
          return cartModel;
        },
      );
      if (totalQuantity <= 0) {
        // print("Item Removed: " + product.name!);
        _items.remove(product.id!);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(
          product.id!,
          () {
            /*print(
                'adding ${product.name} ,with quantity = ${quantity} to the cart');*/
            return CartModel(
              id: product.id,
              img: product.img,
              isExist: true,
              name: product.name,
              price: product.price,
              quantity: quantity,
              time: DateTime.now().toString().split('.').first,
              product: product,
            );
          },
        );
      } else {
        Get.snackbar(
          "Item Count",
          "You should at least add an item in the cart !",
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white,
        );
      }
    }
    cartRepo.addItemsToLocalStorage(totalItemsInCart);
    update();
  }

  int? getQuantity(ProductModel product) {
    return existInCart(product) ? _items[product.id]!.quantity : 0;
  }

  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    } else {
      return false;
    }
  }

  int get totalQuantityInCar {
    var totalQuantityInCart = 0;
    _items.forEach((key, CartModel cartModel) {
      totalQuantityInCart += cartModel.quantity!;
    });
    return totalQuantityInCart;
  }

  List<CartModel> get totalItemsInCart => _items.entries
      .map((MapEntry<int, CartModel> item) => item.value)
      .toList();

  int get totalItemsAmount {
    var totalAmount = 0;
    _items.forEach((int key, CartModel cartItem) {
      totalAmount += (cartItem.price! * cartItem.quantity!);
    });
    return totalAmount;
  }

  // This is for get items in local storage only when the app is Open or Kill.
  List<CartModel> getItemsInLocalStorage() {
    localStorageItems = [];
    //localStorageItems = cartRepo.getItemsInCartList();
    setItemsInLocalStorage = cartRepo.getItemsInLocalStorage();
    return localStorageItems;
  }

  set setItemsInLocalStorage(List<CartModel> storageItems) {
    localStorageItems = storageItems;
    /*print(
        'Total items in local storage: ' + localStorageItems.length.toString());*/
    for (var i = 0; i < localStorageItems.length; i++) {
      _items.putIfAbsent(
        localStorageItems[i].product!.id!,
        () {
          return localStorageItems[i];
        },
      );
    }
  }

  // This for add items to cart history

  void addItemsToCartHistory() {
    cartRepo.addItemsToCartHistory();
    clearItems();
  }

  List<CartModel> getItemsInCartHistory() {
    return cartRepo.getItemsInCartHistory();
  }

  void clearItems() {
    //_items = {};
    _items.clear();
    update();
  }

  set setItemsOrderedHistory(Map<int, CartModel> orderedItems) {
    _items.clear();
    _items = orderedItems;
  }

  void addItemsToLocalStorage() {
    cartRepo.addItemsToLocalStorage(totalItemsInCart);
    update();
  }

  void clearCartHistory() {
    cartRepo.clearCartHistory();
    update();
  }

  // This for test the code only
  void remove() {
    cartRepo.removeItems();
    getlenght();
  }

  void getlenght() {
    print(
        'lenght local: ' + cartRepo.getItemsInLocalStorage().length.toString());
    print('lenght history: ' +
        cartRepo.getItemsInCartHistory().length.toString());
  }

  void showeTime() {
    cartRepo.showTime();
  }
}
