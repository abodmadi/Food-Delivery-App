import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationRepo extends GetxService {
  final ApiClient apiClient;
  final SharedPreferences sharedPrefInstance;
  LocationRepo({required this.apiClient, required this.sharedPrefInstance});
}
