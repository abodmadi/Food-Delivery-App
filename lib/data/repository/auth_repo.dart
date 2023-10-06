import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo extends GetxService {
  final ApiClient apiClient;
  final SharedPreferences sharedPrefInstance;

  AuthRepo({
    required this.apiClient,
    required this.sharedPrefInstance,
  });

  Future<Response> registration({required dynamic signUpBody}) async {
    return await apiClient.postData(
        uri: AppConstants.REGISTRATION_URI, body: signUpBody);
  }

  Future saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    await sharedPrefInstance.setString(AppConstants.TOKEN, token);
  }
}
