import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ronventory_mobile/app/controller/settings/settings_controller.dart';
import 'package:ronventory_mobile/app/core/auth_manager.dart';
import 'package:ronventory_mobile/app/core/common_widgets/input_decoration.widget.dart';
import 'package:ronventory_mobile/app/general/color/app_colors.dart';
import 'package:ronventory_mobile/app/messages/user/user_messages.snackbar.dart';
import 'package:ronventory_mobile/app/model/user/submodel/user_create_request_model.dart';
import 'package:ronventory_mobile/app/model/user/submodel/user_create_response_model.dart';
import 'package:ronventory_mobile/app/model/user/submodel/user_update_request_model.dart';
import 'package:ronventory_mobile/app/model/user/submodel/user_update_response_model.dart';
import 'package:ronventory_mobile/app/model/user/user_model.dart';
import 'package:ronventory_mobile/app/repository/user/user_repository.dart';
import 'package:ronventory_mobile/app/view/user/user_view.dart';

class UserController extends GetxController {
  late final AuthManager _authManager;
  late final UserRepository _userRepository;


  var dataProcessing = false.obs;

  var userListTask = <ConclusionUser>[].obs;

  GlobalKey<FormState> userFormKey = GlobalKey();

  UserModel? userModel;

  UserCreateResponseModel? userCreateResponseModel;
  UserUpdateResponseModel? userUpdateResponseModel;
  SettingsController? _settingsController;

  late TextEditingController emailController,
      passwordController,
      nameController;

  @override
  void onInit() {
    super.onInit();
    _authManager = Get.put(AuthManager());
    _userRepository = Get.put(UserRepository());
    _settingsController = Get.put(SettingsController());
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
  }

  Future<UserModel?> userList() async {
    dataProcessing.value = true;
    _authManager.bringToken();
    final token = _authManager.token;
    userModel = await _userRepository.userList(token!);
    userListTask.assignAll(userModel!.result!.conclusion!);
    dataProcessing.value = false;
    final newToken = userModel!.result!.token!;
    _authManager.enterToken(newToken);
  }

  Future<UserCreateResponseModel?> userCreate(
      String email, String password, String name) async {
    _authManager.bringToken();
    final token = _authManager.token;
    userCreateResponseModel = await _userRepository.userCreate(
      token!,
      UserCreateRequestModel(
        email: email,
        password: password,
        name: name,
      ),
    );
    final newToken = userCreateResponseModel!.result!.token;
    _authManager.enterToken(newToken);
  }
  Future<UserCreateResponseModel?> userUpdate(
      String name, String email, String password, int id) async {
    _authManager.bringToken();
    final token = _authManager.token;
    userUpdateResponseModel = await _userRepository.userUpdate(
        token!,
        UserUpdateRequestModel(name: name, email: email, password: password),
        id);
    final newToken = userUpdateResponseModel!.result!.token!;
    _authManager.enterToken(newToken);
  }

  AwesomeDialog userUpdateMethod(BuildContext context, int index) {
    return AwesomeDialog(
      context: context,
      dialogBackgroundColor: Colors.grey.shade900,
      animType: AnimType.SCALE,
      dialogType: DialogType.NO_HEADER,
      btnCancelText: '',
      btnCancelIcon: FontAwesomeIcons.times,
      btnOkText: '',
      btnOkIcon: FontAwesomeIcons.paperPlane,
      body: Form(
        key: userFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: TextFormField(


                controller: nameController,
                style: TextStyle(color: AppColors().kTextColor),
                cursorColor: AppColors().kCursorColor,
                decoration: InputDecorationWidget().inputDecoration(
                    'Kullanıcı Adı?', FontAwesomeIcons.user),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: TextFormField(

                controller: emailController,
                style: TextStyle(color: AppColors().kTextColor),
                cursorColor: AppColors().kCursorColor,
                decoration:
                InputDecorationWidget().inputDecoration('Email?', FontAwesomeIcons.mailBulk),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child:Obx(()=>
                    TextFormField(
                      obscureText: _settingsController!.isObscure.value,
                      controller: passwordController,
                      style: TextStyle(color: AppColors().kTextColor),
                      cursorColor: AppColors().kCursorColor,
                      decoration:
                      InputDecorationWidget().inputDecoration(
                        'Parola?', FontAwesomeIcons.lock,
                        suffixIcon: IconButton(
                          onPressed: () {

                            _settingsController!.isObscure.value = !_settingsController!.isObscure.value;

                          },
                          icon: _settingsController!.isObscure.value == true
                              ? const Icon(
                            Icons.visibility_off,
                          )
                              : const Icon(
                            Icons.visibility,
                            color: Colors.white,
                          ),
                        ),



                      ),
                    ),

                )
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      btnCancelOnPress: () {
        emailController.text="";
        passwordController.text="";
        nameController.text="";
        Get.off(UserView());
      },
      btnOkOnPress: () async {
        if (nameController.text.isEmpty) {
          UserMessages.userCreateNameFail();

        } else if(emailController.text.isEmpty || emailController.text.length<6){
          UserMessages.userCreateEmailFail();

        }
        else if(!emailController.text.contains("@")){
          UserMessages.userCreateEmailContainFail();

        }

        else if(passwordController.text.length<6){
          UserMessages.userCreatePasswordFail();

        }

        else {

          await userUpdate(
              nameController.text,
              emailController.text,
              passwordController.text,

              userListTask[index].id!,


          );
          emailController.text="";
          passwordController.text="";
          nameController.text="";
          UserMessages.userUpdateSuccess();
          await userList();
        }
      },
    );
  }
}
