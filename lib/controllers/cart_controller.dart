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

  void addItem(ProductModel product, int quantity) {
    late var totalQuantity;
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id!,
        (CartModel cartModel) {
          totalQuantity = cartModel.quantity! + quantity;
          cartModel.quantity = cartModel.quantity! + quantity;
          cartModel.product = product;
          cartModel.time = DateTime.now().toString();
          return cartModel;
        },
      );
      if (totalQuantity <= 0) {
        print("Item Removed: " + product.name!);
        _items.remove(product.id!);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(
          product.id!,
          () {
            print(
                'adding ${product.name} ,with quantity = ${quantity} to the cart');
            return CartModel(
              id: product.id,
              img: product.img,
              isExist: true,
              name: product.name,
              price: product.price,
              quantity: quantity,
              time: DateTime.now().toString(),
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

  ///
  ///
}
