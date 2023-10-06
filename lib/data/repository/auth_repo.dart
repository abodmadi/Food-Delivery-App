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

  Future<String> getUserToken() async {
    return sharedPrefInstance.getString(AppConstants.TOKEN) ?? 'None';
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPrefInstance.setString(AppConstants.TOKEN, token);
  }

  bool isUserLoggedIn() {
    return sharedPrefInstance.containsKey(AppConstants.TOKEN);
  }

  Future<Response> logIn({required dynamic signInBody}) async {
    return await apiClient.postData(
        uri: AppConstants.LOGIN_URI, body: signInBody);
  }

  Future saveUserPhoneAndPassword(
      {required String phone, required String password}) async {
    try {
      await sharedPrefInstance.setString(AppConstants.PHONE, phone);
      await sharedPrefInstance.setString(AppConstants.PASSWORD, password);
    } catch (ex) {
      throw ex;
    }
  }

  bool logOut() {
    sharedPrefInstance.remove(AppConstants.TOKEN);
    apiClient.token = '';
    apiClient.updateHeader('');
    sharedPrefInstance.remove(AppConstants.PHONE);
    sharedPrefInstance.remove(AppConstants.PASSWORD);
    return true;
  }
}
