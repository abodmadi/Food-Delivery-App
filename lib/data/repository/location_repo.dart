import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationRepo extends GetxService {
  final ApiClient apiClient;
  final SharedPreferences sharedPrefInstance;
  LocationRepo({required this.apiClient, required this.sharedPrefInstance});

  Future<Response> getAddressFromGeoCode(
    LatLng latLng,
  ) async {
    return await apiClient.getData(
        uri: '${AppConstants.GEOCODE_URI}'
            '?lat=${latLng.latitude}&lng=${latLng.longitude}');
  }
}
