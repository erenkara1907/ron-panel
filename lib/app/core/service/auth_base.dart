import 'package:ronventory_mobile/app/model/auth/login/login_request_model.dart';
import 'package:ronventory_mobile/app/model/auth/login/login_response_model.dart';
import 'package:ronventory_mobile/app/model/auth/register/register_request_model.dart';
import 'package:ronventory_mobile/app/model/auth/register/register_response_model.dart';

abstract class AuthBase {
  Future<LoginResponseModel?> login(LoginRequestModel model);

  Future<RegisterResponseModel?> register(RegisterRequestModel model);
}
