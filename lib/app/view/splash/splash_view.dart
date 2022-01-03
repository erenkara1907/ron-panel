import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ronventory_mobile/app/controller/splash/splash_controller.dart';
import 'package:ronventory_mobile/app/view/login/login_view.dart';
import 'package:ronventory_mobile/app/view/onboard/onboard_view.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitingView();
        } else {
          if (snapshot.hasError) {
            return errorView(snapshot);
          } else {
            return OnBoard();
          }
        }
      },
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(
      body: Center(
        child: Text('Error : ${snapshot.error}'),
      ),
    );
  }

  Scaffold waitingView() {
    return Scaffold(
        body: SplashScreenView(
      navigateRoute: LoginView(),
      duration: 4000,
      imageSize: 130,
      imageSrc: "assets/splash.jpeg",
      text: "PANEL",
      textType: TextType.ColorizeAnimationText,
      textStyle: GoogleFonts.montserrat(
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.italic,
          fontSize: 20),
      colors: [
        Colors.grey,
        Colors.grey.shade300,
        Colors.grey.shade500,
        Colors.grey.shade700,
        Colors.white,
      ],
      backgroundColor: Colors.black,
    ));
  }
}