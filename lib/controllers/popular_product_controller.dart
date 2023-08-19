import 'dart:convert';

import 'package:food_delivery_app/data/repository/popular_product_repo.dart';
import 'package:food_delivery_app/models/product_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  bool _isLoding = false;

  bool get isLoding => _isLoding;

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
}
