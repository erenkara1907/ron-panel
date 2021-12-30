import 'package:get/get.dart';
import 'package:ronventory_mobile/app/core/auth_manager.dart';

class SplashController extends GetxController {

  late final AuthManager _authManager;

  @override
  void onInit() {
    super.onInit();
    _authManager = Get.put(AuthManager());
  }

  Future<void> initializeSettings() async {
    await _authManager.checkLoginStatus();

    // Simulate other services for 3 seconds
    await Future.delayed(const Duration(seconds: 3));
  }
}