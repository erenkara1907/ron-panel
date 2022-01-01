import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ronventory_mobile/app/controller/settings/settings_controller.dart';
import 'package:ronventory_mobile/app/controller/status_group/status_group_controller.dart';
import 'package:ronventory_mobile/app/core/auth_manager.dart';
import 'package:ronventory_mobile/app/core/common_widgets/awesome_dialog.widget.dart';
import 'package:ronventory_mobile/app/core/common_widgets/input_decoration.widget.dart';
import 'package:ronventory_mobile/app/general/color/app_colors.dart';
import 'package:ronventory_mobile/app/messages/status/status_messages.snackbar.dart';
import 'package:ronventory_mobile/app/messages/status_group/status_group_messages.snackbar.dart';
import 'package:ronventory_mobile/app/model/status/status_model.dart';
import 'package:ronventory_mobile/app/model/status/submodel/statu_response_model.dart';
import 'package:ronventory_mobile/app/model/status/submodel/status_request_model.dart';
import 'package:ronventory_mobile/app/repository/status/status_repository.dart';
import 'package:ronventory_mobile/app/view/status/status_view.dart';

class StatusController extends GetxController {
  late final AuthManager _authManager;
  late final StatusRepository _statusRepository;

  var dataProcessing = false.obs;

  StatusModel? statusModel;
  StatusResponseModel? statusResponseModel;
  late SettingsController _settingsController;
  late StatusGroupController _statusGroupController;

  late TextEditingController titleController, optionsController;

  var statusListTask = <ConclusionStatus>[].obs;
  GlobalKey<FormState> statusFormKey = GlobalKey();

  @override
  void onInit() {
    super.onInit();
    _authManager = Get.put(AuthManager());
    _statusRepository = Get.put(StatusRepository());
    _statusGroupController = Get.put(StatusGroupController());
    _settingsController = Get.put(SettingsController());
    titleController = TextEditingController();
    optionsController = TextEditingController();
  }

  Future<StatusModel?> statusList() async {
    dataProcessing.value = true;
    _authManager.bringToken();
    final token = _authManager.token;
    statusModel = await _statusRepository.statusList(token!);
    statusListTask.assignAll(statusModel!.result!.conclusion!);
    dataProcessing.value = false;
    final newToken = statusModel!.result!.token;
    _authManager.enterToken(newToken);
  }

  Future<StatusResponseModel?> statusCreate(
      String title, String settings, int group_id) async {
    _authManager.bringToken();
    final token = _authManager.token;
    statusResponseModel = await _statusRepository.statusCreate(
        token!,
        StatusRequestModel(
            title: title, settings: settings, group_id: group_id));
    final newToken = statusResponseModel!.result!.token;
    _authManager.enterToken(newToken);
  }

  Future<StatusResponseModel?> statusUpdate(
      String title, String settings, int group_id, int id) async {
    _authManager.bringToken();
    final token = _authManager.token;
    statusResponseModel = await _statusRepository.statusUpdate(
        token!,
        StatusRequestModel(
            title: title, settings: settings, group_id: group_id),
        id);
    final newToken = statusResponseModel!.result!.token;
    _authManager.enterToken(newToken);
  }

  /// Status Update

  AwesomeDialog statusUpdateMethod(BuildContext context, int index) {
    return AwesomeDialogWidget().awesomeDialog(
      context,
      btnOkOnPress: () async {
        if (titleController.text.isEmpty || titleController.text == null) {
          StatusMessages.statusUpdateTitleFail();
        } else if (optionsController.text.isEmpty ||
            optionsController.text == null) {
          StatusMessages.statusUpdateOptionsFail();
        } else {
          Get.back();
          await statusUpdate(
            titleController.text,
            optionsController.text,
            int.parse(_settingsController.selectedGroupID.value),
            statusListTask[index].id!,
          );

          titleController.text = '';
          optionsController.text = '';
          await statusList();
        }
      },
      btnCancelOnPress: () {
        Get.back();
        titleController.text = '';
        optionsController.text = '';
      },
      body: Form(
        key: statusFormKey,
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
                    '${statusListTask[index].title}',
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
                    '${statusListTask[index].settings}', FontAwesomeIcons.cogs),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Obx(() => SizedBox(
                width: Get.width / 1.7,
                height: Get.height / 14,
                child: FutureBuilder(
                  future: _settingsController.getGroupID(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0))),
                        hint: const Text('Statü Grup seçiniz'),
                        onChanged: (String? newID) {
                          _settingsController.setSelectedGroupId(newID!);
                        },
                        items: _statusGroupController.statusGroupListTask
                            .map((map) {
                          return DropdownMenuItem<String>(
                            value: map.id.toString(),
                            child: Text("${map.title}"),
                          );
                        }).toList(),
                      );
                    } else {
                      return const Text("Liste bulunamadı");
                    }
                  },
                )))
          ],
        ),
      ),
    );
  }

  /// Status Create
  AwesomeDialog statusCreateMethod(BuildContext context) {
    return AwesomeDialogWidget().awesomeDialog(
      context,
      btnOkOnPress: () async {
        if (titleController.text == null || titleController.text.isEmpty) {
          StatusGroupMessages.statusGroupCreateTitleFail();
        } else if (optionsController.text == null ||
            optionsController.text.isEmpty) {
          StatusGroupMessages.statusGroupCreateSettingsFail();
        } else {
          Get.off(StatusView());
          await statusCreate(titleController.text, optionsController.text,
              int.parse(_settingsController.selectedGroupID.value));
          titleController.text = '';
          optionsController.text = '';
          await statusList();
        }
      },
      btnCancelOnPress: () {
        Get.back();
        titleController.text = '';
        optionsController.text = '';
      },
      body: Form(
        key: statusFormKey,
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
                controller: optionsController,
                style: TextStyle(color: AppColors().kTextColor),
                cursorColor: AppColors().kCursorColor,
                decoration: InputDecorationWidget()
                    .inputDecoration('Ayarlar', FontAwesomeIcons.cogs),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Obx(
              () => SizedBox(
                width: Get.width / 1.7,
                height: Get.height / 14,
                child: FutureBuilder(
                  future: _settingsController.getGroupID(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0))),
                        hint: const Text('Statü Grup seçiniz'),
                        onChanged: (String? newID) {
                          _settingsController.setSelectedGroupId(newID!);
                        },
                        items: _statusGroupController.statusGroupListTask
                            .map((map) {
                          return DropdownMenuItem<String>(
                            value: map.id.toString(),
                            child: Text("${map.title}"),
                          );
                        }).toList(),
                      );
                    } else {
                      return const Text("Liste bulunamadı");
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
