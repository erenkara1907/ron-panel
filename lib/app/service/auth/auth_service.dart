import 'package:get/get.dart';
import 'package:ronventory_mobile/app/core/service/auth_base.dart';
import 'package:ronventory_mobile/app/model/auth/login/login_request_model.dart';
import 'package:ronventory_mobile/app/model/auth/login/login_response_model.dart';
import 'package:ronventory_mobile/app/model/auth/register/register_request_model.dart';
import 'package:ronventory_mobile/app/model/auth/register/register_response_model.dart';
import 'package:ronventory_mobile/app/util/consts.dart';

class AuthService extends GetConnect with AuthBase {
  @override
  Future<LoginResponseModel?> login(LoginRequestModel model) async {
    final response =
        await post(loginUrl, model.toJson(), headers: {"x-device": "mobile"});
    return LoginResponseModel.fromJson(response.body);
  }

  @override
  Future<RegisterResponseModel?> register(RegisterRequestModel model) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
