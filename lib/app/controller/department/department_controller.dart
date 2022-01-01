import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ronventory_mobile/app/controller/settings/settings_controller.dart';
import 'package:ronventory_mobile/app/controller/user/user_controller.dart';
import 'package:ronventory_mobile/app/core/auth_manager.dart';
import 'package:ronventory_mobile/app/core/common_widgets/awesome_dialog.widget.dart';
import 'package:ronventory_mobile/app/core/common_widgets/input_decoration.widget.dart';
import 'package:ronventory_mobile/app/general/color/app_colors.dart';
import 'package:ronventory_mobile/app/messages/department/department_messages.sncakbar.dart';
import 'package:ronventory_mobile/app/model/department/department_model.dart';
import 'package:ronventory_mobile/app/model/department/submodel/department_request_model.dart';
import 'package:ronventory_mobile/app/model/department/submodel/department_response_model.dart';
import 'package:ronventory_mobile/app/repository/department/department_repository.dart';
import 'package:ronventory_mobile/app/view/department/department_view.dart';

class DepartmentController extends GetxController {
  late final AuthManager _authManager;
  late final DepartmentRepository _departmentRepository;

  late SettingsController _settingsController;
  late UserController _userController;

  var dataProcessing = false.obs;

  DepartmentModel? departmentModel;
  DepartmentResponseModel? departmentResponseModel;

  late TextEditingController titleController;
  late TextEditingController parentTypeController;

  var departmentListTask = <ConclusionDepartment>[].obs;

  GlobalKey<FormState> departmentFormKey = GlobalKey();

  @override
  void onInit() async {
    super.onInit();
    _authManager = Get.put(AuthManager());
    _departmentRepository = Get.put(DepartmentRepository());

    _settingsController = Get.put(SettingsController());

    _userController = Get.put(UserController());
    titleController = TextEditingController();
    parentTypeController = TextEditingController();
  }

  Future<DepartmentModel?> departmentList() async {
    dataProcessing.value = true;
    _authManager.bringToken();
    final token = _authManager.token;
    departmentModel = await _departmentRepository.departmentList(token!);
    departmentListTask.assignAll(departmentModel!.result!.conclusion!);
    dataProcessing.value = false;
    final newToken = departmentModel!.result!.token!;
    _authManager.enterToken(newToken);
  }

  Future<DepartmentResponseModel?> departmentCreate(
      String title, String parentType, int parentId, int adminId) async {
    _authManager.bringToken();
    final token = _authManager.token;
    departmentResponseModel = await _departmentRepository.departmentCreate(
        token!,
        DepartmentRequestModel(
          title: title,
          parentType: parentType,
          parentId: parentId,
          adminId: adminId,
        ));
    final newToken = departmentResponseModel!.result!.token;
    _authManager.enterToken(newToken);
  }

  Future<DepartmentResponseModel?> departmentDelete(int id) async {
    _authManager.bringToken();
    final token = _authManager.token;
    departmentResponseModel = await _departmentRepository.departmentDelete(
        token!, DepartmentRequestModel(), id);
    final newToken = departmentResponseModel!.result!.token;
    _authManager.enterToken(newToken);
  }

  Future<DepartmentResponseModel?> departmentUpdate(String title,
      String parentType, int parentId, int adminId, int id) async {
    _authManager.bringToken();
    final token = _authManager.token;
    departmentResponseModel = await _departmentRepository.departmentUpdate(
        token!,
        DepartmentRequestModel(
          title: title,
          parentType: parentType,
          parentId: parentId,
          adminId: adminId,
        ),
        id);
    final newToken = departmentResponseModel!.result!.token;
    _authManager.enterToken(newToken);
  }

  /// Department Update
  AwesomeDialog departmentUpdateMethod(BuildContext context, int index) {
    return AwesomeDialogWidget().awesomeDialog(
      context,
      btnOkOnPress: () async {
        if (titleController.text == null || titleController.text.isEmpty) {
          DepartmentMessages.departmentCreateTitleFail();
        } else {
          Get.back();
          await departmentUpdate(
              titleController.text,
              _settingsController.selectedParentType.value,
              int.parse(_settingsController.selectedDepartmentId.value),
              int.parse(_settingsController.selectedUserId.value),
              departmentListTask[index].id!);

          titleController.text = '';
          await departmentList();
        }
      },
      btnCancelOnPress: () {
        Get.back();
        titleController.text = '';
      },
      body: Form(
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
                    '${departmentListTask[index].title}',
                    FontAwesomeIcons.envelopeOpenText),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Obx(() => SizedBox(
                  width: Get.width / 1.7,
                  height: Get.height / 14,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                    hint: const Text("Kullanıcı seçiniz"),
                    onChanged: (newValue) {
                      _settingsController.setSelectedUserId(newValue!);
                    },
                    items: _userController.userListTask.map((map) {
                      return DropdownMenuItem(
                          value: map.id.toString(), child: Text("${map.name}"));
                    }).toList(),
                  ),
                )),
            const SizedBox(height: 15,),
            Obx(
              () => SizedBox(
                width: Get.width / 1.7,
                height: Get.height / 14,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                  items: _settingsController.parentType
                      .map((String item) => DropdownMenuItem<String>(
                          child: Text(item), value: item))
                      .toList(),
                  onChanged: (String? newValue) {
                    _settingsController.setSelectedParentType(newValue!);
                  },
                  value: _settingsController.selectedParentType.value,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Obx(
              () => _settingsController.selectedParentType.value == 'child'
                  ? SizedBox(
                      width: Get.width / 1.7,
                      height: Get.height / 14,
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0))),
                        hint: const Text("Parent seçiniz"),
                        onChanged: (String? newValue) {
                          _settingsController
                              .setSelectedDepartmentId(newValue!);
                        },
                        items: departmentListTask.map((map) {
                          return DropdownMenuItem(
                              value: map.id.toString(),
                              child: Text("${map.title}"));
                        }).toList(),
                      ),
                    )
                  : Text(''),
            ),
          ],
        ),
      ),
    );
  }

  /// Department Create
  AwesomeDialog departmentCreateMethod(BuildContext context) {
    return AwesomeDialogWidget().awesomeDialog(
      context,
      btnOkOnPress: () async {
        if (titleController.text == null ||
            titleController.text.isEmpty) {
          DepartmentMessages.departmentCreateTitleUpdateFail();
        } else {
          Get.back();
          Get.off(DepartmentView());
          await departmentCreate(
              titleController.text,
              _settingsController.selectedParentType.value,
              int.parse(_settingsController.selectedDepartmentId.value),
              int.parse(_settingsController.selectedUserId.value));
          titleController.text = '';
          _settingsController.selectedParentType.value = 'parent';
          await departmentList();
        }
      },
      btnCancelOnPress: (){
        Get.back();
        titleController.text = '';
        _settingsController.selectedParentType.value = 'parent';
      },
      body: Form(
        key: departmentFormKey,
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
                decoration: InputDecorationWidget()
                    .inputDecoration('Başlık?', FontAwesomeIcons.question),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(
                  () => SizedBox(
                width: Get.width / 1.7,
                height: Get.height / 14,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                  items: _settingsController.parentType
                      .map((String item) => DropdownMenuItem<String>(
                      child: Text(item), value: item))
                      .toList(),
                  onChanged: (String? newValue) {
                    _settingsController.setSelectedParentType(newValue!);
                  },
                  value: _settingsController.selectedParentType.value,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(
                  () => SizedBox(
                width: Get.width / 1.7,
                height: Get.height / 14,
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                  hint: const Text('Kullanıcı seçiniz'),
                  onChanged: (String? newValue) {
                    _settingsController.setSelectedUserId(newValue!);
                  },
                  items: _userController.userListTask.map((map) {
                    return DropdownMenuItem(
                      value: map.id.toString(),
                      child: Text("${map.name}"),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(
                  () => _settingsController.selectedParentType.value == 'child'
                  ? SizedBox(
                width: Get.width / 1.7,
                height: Get.height / 14,
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                  hint: const Text('Departman seçiniz'),
                  onChanged: (String? newValue) {
                    _settingsController
                        .setSelectedDepartmentId(newValue!);
                  },
                  items:
                  departmentListTask.map((map) {
                    return DropdownMenuItem(
                        value: map.id.toString(),
                        child: Text("${map.title}"));
                  }).toList(),
                ),
              )
                  : const Text(''),
            ),
          ],
        ),
      ),
    );
  }
}
