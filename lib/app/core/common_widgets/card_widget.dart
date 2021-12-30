import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ronventory_mobile/app/controller/auth/auth_controller.dart';
import 'package:ronventory_mobile/app/general/color/app_colors.dart';
import 'package:ronventory_mobile/app/general/text/app_text.style.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.title,
    required this.borderColor,
    required this.shadowColor,
    this.children,
  });

  final Color shadowColor;
  final Color borderColor;
  final String title;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      height: Get.height / 8,
      child: Card(
          elevation: 2,
          shadowColor: shadowColor,
          color: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(
                color: borderColor,
              )),
          child: Center(
            child: ListTile(
              title: Text(
                title,
                style: AppTextStyle().kTextStyleHeader,
              ),
              subtitle: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: children!,
              ),
            ),
          )),
    );
  }
}