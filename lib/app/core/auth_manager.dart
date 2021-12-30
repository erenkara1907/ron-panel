import 'package:get/get.dart';
import 'package:ronventory_mobile/app/core/cache_manager.dart';
import 'package:ronventory_mobile/app/view/login/login_view.dart';

class AuthManager extends GetxController with CacheManager {
  final isLogged = false.obs;
  String? token;

  void logOut() {
    isLogged.value = false;
    removeToken();
    Get.off(LoginView());
  }

  Future<void> enterToken(String? token) async {
    isLogged.value = true;
    await saveToken(token!);
  }

  Future<void> bringToken() async {
    token= getToken();
  }

  Future<void> checkLoginStatus() async {
    token = getToken();
    if (token != null) {
      isLogged.value = true;
    }
  }
}
