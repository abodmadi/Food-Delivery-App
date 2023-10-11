import 'package:food_delivery_app/data/repository/auth_repo.dart';
import 'package:food_delivery_app/models/response_model.dart';
import 'package:food_delivery_app/models/sign_in_model.dart';
import 'package:food_delivery_app/models/sign_up_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  bool _isVisible = false;
  bool get isVisible => _isVisible;
  Future<ResponseModel> registration({required SignUpModel signUpBody}) async {
    _isLoaded = true;
    update();
    Response response =
        await authRepo.registration(signUpBody: signUpBody.toJson());
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      print('The registration token controller:' +
          response.body['token'].toString());
      await authRepo.saveUserToken(response.body['token']);
      responseModel = ResponseModel(true, response.body['token']);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoaded = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> logIn({required SignInModel signInBody}) async {
    /*print(
        'The getting user token: ' + await authRepo.getUserToken().toString());*/
    authRepo.getUserToken();
    _isLoaded = true;
    update();
    Response response = await authRepo.logIn(signInBody: signInBody.toJson());
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      await authRepo.saveUserToken(response.body['token']);
      print('The Login token controller:' + response.body['token'].toString());

      responseModel = ResponseModel(true, response.body['token']);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoaded = false;
    update();
    return responseModel;
  }

  Future<void> saveUserPhoneAndPassword(
      {required String phone, required String password}) async {
    await authRepo.saveUserPhoneAndPassword(phone: phone, password: password);
  }

  visibleOrNotPassword() {
    _isVisible = !_isVisible;
    update();
  }

  bool isUserLoggedIn() {
    return authRepo.isUserLoggedIn();
  }

  bool logOut() {
    return authRepo.logOut();
  }
}
