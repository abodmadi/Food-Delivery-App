import 'package:food_delivery_app/data/repository/auth_repo.dart';
import 'package:food_delivery_app/models/response_model.dart';
import 'package:food_delivery_app/models/sign_up_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<ResponseModel> registration({required SignUpModel signUpBody}) async {
    _isLoaded = true;
    update();
    Response response =
        await authRepo.registration(signUpBody: signUpBody.toJson());
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      await authRepo.saveUserToken(response.body['token']);
      responseModel = ResponseModel(true, response.body['token']);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoaded = false;
    update();
    return responseModel;
  }
}
