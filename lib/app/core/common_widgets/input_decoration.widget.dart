import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ronventory_mobile/app/general/color/app_colors.dart';
import 'package:ronventory_mobile/app/general/text/app_text.style.dart';

class InputDecorationWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  InputDecoration inputDecoration(String labelText, IconData iconData,
      {String? prefix, String? helperText, Widget? suffixIcon}) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      helperText: helperText,
      labelText: labelText,
      labelStyle: AppTextStyle().kTextStyleFourteenWithThemeColor,
      fillColor: Colors.transparent,
      filled: true,
      prefixText: prefix,
      suffixIcon: suffixIcon,
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 14.0),
        child: FaIcon(
          iconData,
          color: Colors.white,
          size: 20,
        ),
      ),
      prefixIconConstraints: const BoxConstraints(minWidth: 60),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors().kEnabledColor)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors().kFocusedColor)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors().kErrorColor)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
