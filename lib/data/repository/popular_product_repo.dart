import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';

// This repo communicate with client class to connect in the internet (server)
// When connect in the internet should be use GetxService
// Repository responciple to call methods in api client (Get,post,Delete,Put Data) and then send it to controller
class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({
    required this.apiClient,
  });

  Future<Response> getPopularProductList() async {
    print('Gating data from localhost');
    return await apiClient.getData(uri: AppConstants.POPULAR_PRODUCT_URI);
  }
}
