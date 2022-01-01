import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ronventory_mobile/app/model/product/product_model.dart';

class ProductMessages {

  // Product List
  static productListError(ProductModel response) {
    Get.snackbar(
      'HATA',
      '${response.message}',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Product Create
  static productCreateSuccess() {
    Get.snackbar(
      'Başarılı',
      'Ürün başarıyla eklendi',
      colorText: Colors.white,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static productCreateFail() {
    Get.snackbar(
      'Başarısız',
      'Ürün eklenemedi',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static productCreateTitleFail() {
    Get.snackbar(
      'Başarısız',
      'Lütfen Başlık Ekleyiniz!',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static productCreateSerialNumberFail() {
    Get.snackbar(
      'Başarısız',
      'Lütfen Seri Numarası Ekleyiniz!',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }


  static productCreateTitleUpdateFail() {
    Get.snackbar(
      'Başarısız',
      'Lütfen Başlık Ekleyiniz!',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Product Update
  static productUpdateSuccess() {
    Get.snackbar(
      'Başarılı',
      'Ürün başarıyla güncellendi',
      colorText: Colors.white,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static productUpdateFail() {
    Get.snackbar(
      'Başarısız',
      'Ürün güncellenemedi',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Product Delete
  static productDeleteSuccess() {
    Get.snackbar(
      'Başarılı',
      'Ürün başarıyla kaldırıldı',
      colorText: Colors.white,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static productDeleteFail() {
    Get.snackbar(
      'Başarısız',
      'Ürün kaldırılamadı',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static productCreateDropCategoryFail() {
    Get.snackbar(
      'Başarısız',
      'Lütfen Kategori Belirleyiniz',
      colorText: Colors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
