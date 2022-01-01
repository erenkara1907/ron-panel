import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ronventory_mobile/app/core/auth_manager.dart';
import 'package:ronventory_mobile/app/core/common_widgets/awesome_dialog.widget.dart';
import 'package:ronventory_mobile/app/core/common_widgets/input_decoration.widget.dart';
import 'package:ronventory_mobile/app/general/color/app_colors.dart';
import 'package:ronventory_mobile/app/messages/category/category_messages.snackbar.dart';
import 'package:ronventory_mobile/app/messages/status_group/status_group_messages.snackbar.dart';
import 'package:ronventory_mobile/app/model/status_group/status_group_model.dart';
import 'package:ronventory_mobile/app/model/status_group/submodel/status_group_request_model.dart';
import 'package:ronventory_mobile/app/model/status_group/submodel/status_group_response_model.dart';
import 'package:ronventory_mobile/app/repository/status_group/status_group_repository.dart';
import 'package:ronventory_mobile/app/view/status_group/status_group_view.dart';
import 'package:ronventory_mobile/app/view/user/user_view.dart';

class StatusGroupController extends GetxController {
  late final AuthManager _authManager;
  late final StatusGroupRepository _statusGroupRepository;

  var dataProcessing = false.obs;

  GlobalKey<FormState> statusGroupFormKey = GlobalKey();

  StatusGroupModel? statusGroupModel;
  StatusGroupResponseModel? statusGroupResponseModel;

  late TextEditingController titleController, optionsController;

  var statusGroupListTask = <ConclusionStatusGroup>[].obs;

  @override
  void onInit() {
    super.onInit();
    _authManager = Get.put(AuthManager());
    _statusGroupRepository = Get.put(StatusGroupRepository());
    titleController = TextEditingController();
    optionsController = TextEditingController();
  }

  Future<StatusGroupModel?> statusGroupList() async {
    dataProcessing.value = true;
    _authManager.bringToken();
    final token = _authManager.token;
    statusGroupModel = await _statusGroupRepository.statusGroupList(token!);
    statusGroupListTask.assignAll(statusGroupModel!.result!.conclusion!);
    dataProcessing.value = false;
    final newToken = statusGroupModel!.result!.token;
    _authManager.enterToken(newToken);
  }

  Future<StatusGroupResponseModel?> statusGroupCreate(
      String title, String options) async {
    _authManager.bringToken();
    final token = _authManager.token;
    statusGroupResponseModel = await _statusGroupRepository.statusGroupCreate(
        token!, StatusGroupRequestModel(title: title, options: options));
    final newToken = statusGroupResponseModel!.result!.token;
    _authManager.enterToken(newToken);
  }

  Future<StatusGroupResponseModel?> statusGroupUpdate(
      String title, String options, int id) async {
    _authManager.bringToken();
    final token = _authManager.token;
    statusGroupResponseModel = await _statusGroupRepository.statusGroupUpdate(
        token!, StatusGroupRequestModel(title: title, options: options), id);
    final newToken = statusGroupResponseModel!.result!.token;
    _authManager.enterToken(newToken);
  }

  /// StatusGroup Update
  AwesomeDialog statusGroupUpdateMethod(BuildContext context, int index) {
    return AwesomeDialogWidget().awesomeDialog(
      context,
      btnOkOnPress: () async {
        if (titleController.text == null || titleController.text.isEmpty) {
          StatusGroupMessages.statusGroupCreateTitleFail();
        } else if (optionsController.text == null ||
            optionsController.text.isEmpty) {
          StatusGroupMessages.statusGroupCreateSettingsFail();
        } else {
          await statusGroupUpdate(titleController.text, optionsController.text,
              statusGroupListTask[index].id!);

          titleController.text = '';
          optionsController.text = '';
          await statusGroupList();
        }
      },
      btnCancelOnPress: () {
        titleController.text = '';
        optionsController.text = '';
        Get.off(StatusGroupView());
      },
      body: Form(
        key: statusGroupFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: TextFormField(
                controller: titleController,
                style: TextStyle(color: AppColors().kTextColor),
                cursorColor: AppColors().kCursorColor,
                decoration: InputDecorationWidget().inputDecoration(
                    '${statusGroupListTask[index].title}',
                    FontAwesomeIcons.envelopeOpenText),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: TextFormField(
                controller: optionsController,
                style: TextStyle(color: AppColors().kTextColor),
                cursorColor: AppColors().kCursorColor,
                decoration: InputDecorationWidget().inputDecoration(
                    '${statusGroupListTask[index].options}',
                    FontAwesomeIcons.cogs),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// StatusGroup Create
  AwesomeDialog statusGroupCreateMethod(BuildContext context) {
    return AwesomeDialogWidget().awesomeDialog(
      context,
      btnOkOnPress: () async {
        if (titleController.text == null ||
            titleController.text.isEmpty) {
          StatusGroupMessages.statusGroupCreateTitleFail();
        } else if (optionsController.text == null ||
            optionsController.text.isEmpty) {
        } else {
          await statusGroupCreate(
            titleController.text,
            optionsController.text,
          );
          titleController.text = '';
          optionsController.text = '';
          await statusGroupList();
          Get.off(StatusGroupView());
        }
      },
      btnCancelOnPress: (){
        titleController.text = '';
        optionsController.text = '';
        Get.back();
      },
      body: Form(
        key: statusGroupFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: TextFormField(
                controller: titleController,
                style: TextStyle(color: AppColors().kTextColor),
                cursorColor: AppColors().kCursorColor,
                decoration: InputDecorationWidget().inputDecoration(
                    'Başlık', FontAwesomeIcons.envelopeOpenText),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: TextFormField(
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? 'Lütfen ayarları giriniz.'
                      : null;
                },
                controller: optionsController,
                style: TextStyle(color: AppColors().kTextColor),
                cursorColor: AppColors().kCursorColor,
                decoration: InputDecorationWidget()
                    .inputDecoration('Ayarlar', FontAwesomeIcons.cogs),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
