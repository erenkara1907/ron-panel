import 'package:flutter/material.dart';
import 'package:get/get.dart';

final ButtonStyle loginStyle = ElevatedButton.styleFrom(
  primary: Colors.black,
  minimumSize: Size(Get.width / 2.2, Get.height / 19),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
    side: BorderSide(color: Colors.grey),
  ),
);
