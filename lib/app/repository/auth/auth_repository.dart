import 'package:get/get.dart';
import 'package:ronventory_mobile/app/core/service/auth_base.dart';
import 'package:ronventory_mobile/app/messages/auth/auth_messages.snackbar.dart';
import 'package:ronventory_mobile/app/model/auth/login/login_request_model.dart';
import 'package:ronventory_mobile/app/model/auth/login/login_response_model.dart';
import 'package:ronventory_mobile/app/model/auth/register/register_request_model.dart';
import 'package:ronventory_mobile/app/model/auth/register/register_response_model.dart';
import 'package:ronventory_mobile/app/service/auth/auth_service.dart';

enum AppMode { DEBUG, RELEASE }

class AuthRepository implements AuthBase {
  final AuthService _authService = Get.put(AuthService());

  AppMode appMode = AppMode.RELEASE;

  @override
  Future<LoginResponseModel?> login(LoginRequestModel model) async {
    if (appMode == AppMode.DEBUG) {
      return null;
    } else {
      final response = await _authService.login(model);
      if(response!.code == 200){
        return response;
      }else {
        await AuthMessages.loginError(response);
      }
    }
  }

  @override
  Future<RegisterResponseModel?> register(RegisterRequestModel model) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
