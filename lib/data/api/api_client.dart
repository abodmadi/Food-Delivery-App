import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token; // Talk with server
  final String appBaseUrl; // Applecation Url need it to talk with server
  // ignore: unused_field
  late Map<String, String> _mainHeaders;
  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = AppConstants.TOKEN; // Long the request
    _mainHeaders = {
      'Content-type':
          'application/json; charset=UTF-8', // Get and Post request for data , Decod and Encode type
      'Authorization': 'Bearer $token', // Authentication client
    };
  }

  Future<Response> getData({required String uri}) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (ex) {
      return Response(
        statusCode: 1,
        statusText: ex.toString(),
      );
    }
  }
}
