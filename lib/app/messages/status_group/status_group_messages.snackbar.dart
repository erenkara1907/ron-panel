import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ronventory_mobile/app/model/status_group/status_group_model.dart';

class StatusGroupMessages {

  // Status Group List
  static statusGroupListError(StatusGroupModel response){
    Get.snackbar(
      'HATA',
      '${response.message}',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Status Group Create
  static statusGroupCreateSuccess() {
    Get.snackbar(
      'Başarılı',
      'Statü grubu başarıyla eklendi',
      colorText: Colors.white,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static statusGroupCreateFail(){
    Get.snackbar(
      'Başarısız',
      'Statü grubu eklenemedi',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  static statusGroupCreateTitleFail(){
    Get.snackbar(
      'Başarısız',
      'Lütfen Başlık Giriniz',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static statusGroupCreateSettingsFail(){
    Get.snackbar(
      'Başarısız',
      'Lütfen ayar ekleyiniz',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Status Group Update
  static statusGroupUpdateSuccess() {
    Get.snackbar(
      'Başarılı',
      'Statü grubu başarıyla güncellendi',
      colorText: Colors.white,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static statusGroupUpdateFail(){
    Get.snackbar(
      'Başarısız',
      'Statü grubu güncellenemedi',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}