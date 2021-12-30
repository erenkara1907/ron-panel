import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ronventory_mobile/app/model/category/category_model.dart';
class CategoryMessages{

  // Category List
  static categoryListError(CategoryModel response){
    Get.snackbar(
      'HATA',
      '${response.message}',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Category Create
  static categoryCreateSuccess() {
    Get.snackbar(
      'Başarılı',
      'Kategori başarıyla eklendi',
      colorText: Colors.white,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static categoryCreateFail(){
    Get.snackbar(
      'Başarısız',
      'Kategori eklenemedi',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static categoryCreateTitleFail(){
    Get.snackbar(
      'Başarısız',
      'Lütfen Başlık Giriniz',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Category Update
  static categoryUpdateSuccess() {
    Get.snackbar(
      'Başarılı',
      'Kategori başarıyla güncellendi',
      colorText: Colors.white,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static categoryUpdateFail(){
    Get.snackbar(
      'Başarısız',
      'Kategori güncellenemedi',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  static categoryUpdateTittleFail(){
    Get.snackbar(
      'Başarısız',
      'Lütfen Başlık Ekleyiniz',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Category Delete
  static categoryDeleteSuccess() {
    Get.snackbar(
      'Başarılı',
      'Kategori başarıyla kaldırıldı',
      colorText: Colors.white,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static categoryDeleteFail(){
    Get.snackbar(
      'Başarısız',
      'Kategori kaldırılamadı',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}