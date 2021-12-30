import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ronventory_mobile/app/model/department/department_model.dart';

class DepartmentMessages {

  // Department List
  static departmentListError(DepartmentModel response){
    Get.snackbar(
      'HATA',
      '${response.message}',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Department Create
  static departmentCreateSuccess(){
    Get.snackbar(
      'Başarılı',
      'Departman başarıyla eklendi',
      colorText: Colors.white,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static departmentCreateFail(){
    Get.snackbar(
      'Başarısız',
      'Departman eklenemedi',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static departmentCreateTitleFail(){
    Get.snackbar(
      'Başarısız',
      'Lütfen Başlık Giriniz',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  static departmentCreateTitleUpdateFail(){
    Get.snackbar(
      'Başarısız',
      'Lütfen Başlık Giriniz',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Department Delete
  static departmentDeleteSuccess(){
    Get.snackbar(
      'Başarılı',
      'Departman başarıyla kaldırıldı',
      colorText: Colors.white,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static departmentDeleteFail(){
    Get.snackbar(
      'Başarısız',
      'Departman kaldırılamadı',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Department Update
  static departmentUpdateSuccess(){
    Get.snackbar(
      'Başarılı',
      'Departman başarıyla güncellendi',
      colorText: Colors.white,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static departmentUpdateFail(){
    Get.snackbar(
      'Başarısız',
      'Departman güncellenemedi',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}