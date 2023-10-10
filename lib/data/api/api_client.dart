import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token; // Talk with server
  final String appBaseUrl; // Application Url need it to talk with server
  // ignore: unused_field
  late Map<String, String> _mainHeaders;
  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = AppConstants.TOKEN; // Long the request
    _mainHeaders = {
      'Content-type':
          'application/json; charset=UTF-8', // Get and Post request for data , Decode and Encode type
      'Authorization': 'Bearer $token', // Authentication client
      //'Connection': 'keep-alive',
    };
  }

  void updateHeader(String token) {
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> getData(
      {required String uri, Map<String, String>? headers}) async {
    try {
      print('Token: ' + token.toString());
      Response response = await get(uri, headers: headers ?? _mainHeaders);
      return response;
    } catch (ex) {
      return Response(
        statusCode: 1,
        statusText: ex.toString(),
      );
    }
  }

  Future<Response> postData(
      {required String uri, required dynamic body}) async {
    //print("Posting Body: " + body.toString());
    try {
      Response response = await post(uri, body, headers: _mainHeaders);
      //print("Response body: " + response.body.toString());
      return response;
    } catch (ex) {
      print(ex.toString());
      return Response(
        statusCode: 1,
        statusText: ex.toString(),
      );
    }
  }
}
