import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsMessages {
  static sidebarListError(){
    Get.snackbar(
      'HATA',
      'Beklenmedik bir hata oluştu}',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}