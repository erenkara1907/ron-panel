import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ronventory_mobile/app/core/auth_manager.dart';
import 'package:ronventory_mobile/app/model/auth/login/login_request_model.dart';
import 'package:ronventory_mobile/app/model/auth/login/login_response_model.dart';
import 'package:ronventory_mobile/app/repository/auth/auth_repository.dart';
import 'package:ronventory_mobile/app/view/home/home_view.dart';

class AuthController extends GetxController {
  late TextEditingController emailController, passwordController;

  late final AuthRepository _authRepository;
  late final AuthManager _authManager;

  @override
  void onInit() {
    super.onInit();
    _authRepository = Get.put(AuthRepository());
    _authManager = Get.put(AuthManager());
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  Future<LoginResponseModel?> login(String email, String password) async {
    final response = await _authRepository
        .login(LoginRequestModel(email: email, password: password));
    final tokenStorage = response!.result!.token!;
    await _authManager.enterToken(tokenStorage);
    Get.off(HomeView());
  }
}
