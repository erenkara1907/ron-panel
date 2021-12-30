import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ronventory_mobile/app/model/auth/login/login_response_model.dart';

class AuthMessages {
  // Login
  static loginError(LoginResponseModel response) {
    Get.snackbar(
      'Kullanıcı Bulunamadı!',
      '${response.message}',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static loginFormEmailError() {
    Get.snackbar(
      'Hatalı Giriş',
      'Mail formu boş veya 6 karakterden az olmamalıdır!',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static loginEmailError() {
    Get.snackbar(
      'Hatalı Giriş',
      'Lütfen doğru bir E-mail adresi giriniz!',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  static loginPasswordError() {
    Get.snackbar(
      'Hatalı Giriş',
      'Parola 6 haneden uzun olmalıdır',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
