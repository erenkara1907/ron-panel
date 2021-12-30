import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ronventory_mobile/app/model/user/user_model.dart';

class UserMessages {
  // User List
  static userListError(UserModel response) {
    Get.snackbar(
      'HATA',
      '${response.message}',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // User Create
  static userCreateSuccess() {
    Get.snackbar(
      'Başarılı',
      'Kullanıcı başarıyla eklendi',
      colorText: Colors.white,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static userCreateFail() {
    Get.snackbar(
      'Başarısız',
      'Kullanıcı eklenemedi',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  static userCreateNameFail() {
    Get.snackbar(
      'Başarısız',
      'Lütfen isim giriniz!',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  static userCreateEmailFail() {
    Get.snackbar(
      'Başarısız',
      'E-mail formu boş olamaz!',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  static userCreateEmailContainFail() {
    Get.snackbar(
      'Başarısız',
      'Lütfen doğru E-mail formatı giriniz!',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  static userCreatePasswordFail() {
    Get.snackbar(
      'Başarısız',
      'Şifre 6 karakterden uzun olmalıdır',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // User Update
  static userUpdateSuccess() {
    Get.snackbar(
      'Başarılı',
      'Kullanıcı başarıyla güncellendi',
      colorText: Colors.white,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static userUpdateFail() {
    Get.snackbar(
      'Başarısız',
      'Kullanıcı güncellenemedi',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // User Delete
  static userDeleteSuccess() {
    Get.snackbar(
      'Başarılı',
      'Kullanıcı başarıyla kaldırıldı',
      colorText: Colors.white,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static userDeleteFail() {
    Get.snackbar(
      'Başarısız',
      'Kullanıcı kaldırılamadı',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
