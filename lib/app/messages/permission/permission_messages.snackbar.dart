import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ronventory_mobile/app/model/permission/permission_model.dart';

class PermissionMessages {
  // Permission List
  static permissionListError(PermissionModel response){
    Get.snackbar(
      'HATA',
      '${response.message}',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Permission Create
  static permissionCreateSuccess() {
    Get.snackbar(
      'Başarılı',
      'Yetki başarıyla eklendi',
      colorText: Colors.white,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static permissionCreateFail(){
    Get.snackbar(
      'Başarısız',
      'Yetki eklenemedi',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}