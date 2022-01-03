import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ronventory_mobile/app/general/text/app_text.style.dart';

class AwesomeDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  AwesomeDialog awesomeDialog(
    BuildContext context, {
    required void Function()? btnOkOnPress,
    required void Function()? btnCancelOnPress,
    required Widget body,
  }) {
    return AwesomeDialog(
        context: context,
        dialogBackgroundColor: Colors.grey.shade900,
        animType: AnimType.SCALE,
        btnOk: ElevatedButton(
          style: sendButton,
          onPressed: btnOkOnPress,
          child: const FaIcon(FontAwesomeIcons.check),
        ),
        dialogType: DialogType.NO_HEADER,
        btnCancel: ElevatedButton(
          style: sendButton,
          onPressed: btnCancelOnPress,
          child: const FaIcon(FontAwesomeIcons.times),
        ),
        body: body);
  }
}

final ButtonStyle sendButton = ElevatedButton.styleFrom(
    primary: Colors.grey.shade900,
    minimumSize: const Size(30, 40),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        side: BorderSide(color: Colors.white)),
    textStyle: AppTextStyle().kTextStyleSignOut);


final ButtonStyle sendButton2 = ElevatedButton.styleFrom(
    primary: Colors.black,
    minimumSize: Size(Get.width/1.7, Get.height/15),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        side: BorderSide(color: Colors.grey)),
    textStyle: AppTextStyle().kTextStyleSignOut);
