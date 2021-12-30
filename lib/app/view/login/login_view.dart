import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ronventory_mobile/app/controller/auth/auth_controller.dart';
import 'package:ronventory_mobile/app/general/color/app_colors.dart';
import 'package:ronventory_mobile/app/general/text/app_text.style.dart';
import 'package:ronventory_mobile/app/messages/auth/auth_messages.snackbar.dart';
import 'package:ronventory_mobile/app/view/login/component/login_button.style.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  late AuthController controller;

  GlobalKey<FormState> formKey = GlobalKey();
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    controller = Get.put(AuthController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: Get.height / 5,
                  child: Image.asset(
                    'assets/logo.png',
                    color: Colors.white,
                  )),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: AppColors().kTextColor),
                  cursorColor: AppColors().kCursorColor,
                  controller: controller.emailController,

                  decoration: inputDecoration(
                      'E-Mail', FontAwesomeIcons.mailBulk),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: TextFormField(
                  obscureText: _isObscure,
                  style: TextStyle(color: AppColors().kTextColor),
                  cursorColor: AppColors().kCursorColor,
                  controller: controller.passwordController,

                  decoration: inputDecoration(
                    'Password',
                    FontAwesomeIcons.lock,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      icon: _isObscure == true
                          ? const Icon(
                        Icons.visibility,
                      )
                          : const Icon(
                        Icons.visibility,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: loginStyle,
                onPressed: () async {
                  if (controller.emailController.text.isEmpty || controller.emailController.text.length<6)
                  {
                    AuthMessages.loginFormEmailError();
                  }
                  else if(!controller.emailController.text.contains('@')){
                    AuthMessages.loginEmailError();
                  }
                  else if(controller.passwordController.text.isEmpty || controller.passwordController.text.length<6){
                    AuthMessages.loginPasswordError();
                  }
                  else{
                    await controller.login(
                        controller.emailController.text,
                        controller.passwordController.text);
                  }
                },
                child: Text('Giriş Yap',
                    style: AppTextStyle()
                        .kTextStyleFourteenWithThemeColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String labelText, IconData iconData,
      {String? prefix, String? helperText, Widget? suffixIcon}) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      helperText: helperText,
      labelText: labelText,
      labelStyle: AppTextStyle().kTextStyleFourteenWithThemeColor,
      fillColor: AppColors().kFillColor,
      filled: true,
      prefixText: prefix,
      suffixIcon: suffixIcon,
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: FaIcon(
          iconData,
          color: AppColors().kIconColor,
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
