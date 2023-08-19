import 'package:food_delivery_app/data/repository/recommended_product_repo.dart';
import 'package:food_delivery_app/models/product_model.dart';
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
}
