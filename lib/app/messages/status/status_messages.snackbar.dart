import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:ronventory_mobile/app/model/status/status_model.dart';

class StatusMessages {

  // Status Group List
  static statusListError(StatusModel response){
    Get.snackbar(
      'HATA',
      '${response.message}',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Status Group Create
  static statusCreateSuccess() {
    Get.snackbar(
      'Başarılı',
      'Statü başarıyla eklendi',
      colorText: Colors.white,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static statusCreateFail(){
    Get.snackbar(
      'Başarısız',
      'Statü eklenemedi',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }



  // Status Group Update
  static statusUpdateSuccess() {
    Get.snackbar(
      'Başarılı',
      'Statü başarıyla güncellendi',
      colorText: Colors.white,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static statusUpdateFail(){
    Get.snackbar(
      'Başarısız',
      'Statü güncellenemedi',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static statusUpdateTitleFail(){
    Get.snackbar(
      'Başarısız',
      'Lütfen Başlık Giriniz',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  static statusUpdateOptionsFail(){
    Get.snackbar(
      'Başarısız',
      'Ayarlar boş olamaz',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}