import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ronventory_mobile/app/model/borrow/borrow_model.dart';

class BorrowMessages {

  // Borrow List
  static borrowListError(BorrowModel response){
    Get.snackbar(
      'HATA',
      '${response.message}',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Borrow Create
  static borrowCreateSuccess() {
    Get.snackbar(
      'Başarılı',
      'Ödünç başarıyla eklendi',
      colorText: Colors.white,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static borrowCreateFail(){
    Get.snackbar(
      'Başarısız',
      'Ödünç eklenemedi',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  static borrowCreateDescriptionFail(){
    Get.snackbar(
      'Başarısız',
      'Açıklama boş olamaz!',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  static borrowCreateDateFail(){
    Get.snackbar(
      'Başarısız',
      'Başlangıç tarihi boş olamaz!',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static borrowCreateUserFail(){
    Get.snackbar(
      'Başarısız',
      'Kullanıcı boş olamaz!',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static borrowCreateProductFail(){
    Get.snackbar(
      'Başarısız',
      'Ürün boş olamaz!',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}