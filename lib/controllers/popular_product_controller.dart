import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/data/repository/popular_product_repo.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/models/product_model.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  bool _isLoding = false;
  bool get isLoding => _isLoding;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;
  late CartController _cart;

  PopularProductController({
    required this.popularProductRepo,
  });

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print("Got the Products");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      print("Popular Products: ${_popularProductList}");
      _isLoding = true;
      update(); // paly the role of setState in Getx
    } else {}
  }

// increasing or decreasing items based on bottom click
  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar(
        'Items Count',
        "You can't reduce more !",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      Get.snackbar(
        'Items Count',
        "You can't add more !",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(CartController cart, ProductModel product) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    _inCartItems = _cart.getQuantity(product)!;
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product)!;
    print('-----------------------------------------');
    _cart.items.forEach((key, value) {
      print('Item name: ' + value.name!);
      print('Item quantity: ' + value.quantity!.toString());
    });
    print('*****************************************');
    print('Total Items in map: ' + _cart.items.length.toString());
    print('-----------------------------------------');
    update();
  }

  int getTotalQuantityInCart() {
    return _cart.totalQuantityInCar;
  }

  List<CartModel> getTotalItemsInCart() {
    return _cart.totalItemsInCart;
  }
}
