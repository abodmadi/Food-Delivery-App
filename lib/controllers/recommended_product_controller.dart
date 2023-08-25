import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/data/repository/recommended_product_repo.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/models/product_model.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  List<dynamic> _recommendedProductList = [];
  bool _isLoding = false;
  RecommendedProductController({
    required this.recommendedProductRepo,
  });
  List<dynamic> get recommendedProductList => _recommendedProductList;
  bool get isLoding => _isLoding;

  late CartController _cartController;

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      print('Got Recommended Products');
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      print('Recommended Products List: ${_recommendedProductList}');
      _isLoding = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    print('Quantity: ' + _quantity.toString());
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
      if (_inCartItems > 0) {
        quantity = -_inCartItems;
        return quantity;
      }
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

  void addItem(ProductModel productModel) {
    _cartController.addItem(productModel, _quantity);
    _quantity = 0;
    _inCartItems = _cartController.getQuantity(productModel)!;
    print('-----------------------------------------');
    _cartController.items.forEach((key, value) {
      print('Item name: ' + value.name!);
      print('Item quantity: ' + value.quantity!.toString());
    });
    print('*****************************************');
    print('Total Items in map: ' + _cartController.items.length.toString());
    print('-----------------------------------------');
    update();
  }

  int getTotalQuantityInCart() {
    return _cartController.totalQuantityInCar;
  }

  List<CartModel> getTotalItemsInCart() {
    return _cartController.totalItemsInCart;
  }

  void intiProduct(CartController cartController, ProductModel productModel) {
    _quantity = 0;
    _inCartItems = 0;
    _cartController = cartController;
    _inCartItems = _cartController.getQuantity(productModel)!;
  }
}
