import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:ronventory_mobile/app/controller/settings/settings_controller.dart';
import 'package:ronventory_mobile/app/core/auth_manager.dart';
import 'package:ronventory_mobile/app/core/common_widgets/awesome_dialog.widget.dart';
import 'package:ronventory_mobile/app/core/common_widgets/input_decoration.widget.dart';
import 'package:ronventory_mobile/app/general/color/app_colors.dart';
import 'package:ronventory_mobile/app/messages/category/category_messages.snackbar.dart';
import 'package:ronventory_mobile/app/model/category/category_model.dart';
import 'package:ronventory_mobile/app/model/category/submodel/category_create_request_model.dart';
import 'package:ronventory_mobile/app/model/category/submodel/category_response_model.dart';
import 'package:ronventory_mobile/app/model/category/submodel/category_update_request_model.dart';
import 'package:ronventory_mobile/app/repository/category/category_repository.dart';
import 'package:ronventory_mobile/app/view/category/category_view.dart';
import 'package:ronventory_mobile/app/view/user/user_view.dart';

class CategoryController extends GetxController {
  late final AuthManager _authManager = Get.put(AuthManager());
  late final CategoryRepository _categoryRepository =
      Get.put(CategoryRepository());
  late final SettingsController _settingsController;

  var dataProcessing = false.obs;

  CategoryModel? categoryModel;
  CategoryResponseModel? categoryResponseModel;

  var categoryListTask = <ConclusionCategory>[].obs;
  var dropdownListTask = <ConclusionCategory>[].obs;

  late TextEditingController titleController;
  final categoryId = 1.obs;
  var categoryName = ''.obs;

  GlobalKey<FormState> categoryCreateFormKey = GlobalKey();
  GlobalKey<FormState> categoryUpdateFormKey = GlobalKey();

  @override
  void onInit() async {
    super.onInit();
    titleController = TextEditingController();
    _settingsController = Get.put(SettingsController());
  }

  Future<CategoryModel?> categoryList() async {
    dataProcessing.value = true;
    _authManager.bringToken();
    final token = _authManager.token;
    categoryModel = await _categoryRepository.categoryList(token!);
    categoryListTask.assignAll(categoryModel!.result!.conclusion!);

    dataProcessing.value = false;
    final newToken = categoryModel!.result!.token!;
    await _authManager.enterToken(newToken);
  }

  Future<CategoryResponseModel?> categoryCreate(
      String title, String parentType, int parentId) async {
    _authManager.bringToken();
    final token = _authManager.token;
    categoryResponseModel = await _categoryRepository.categoryCreate(
        token!,
        CategoryCreateRequestModel(
            title: title, parentType: parentType, parentId: parentId));
    final newToken = categoryResponseModel!.result!.token!;
    _authManager.enterToken(newToken);
  }

  Future<CategoryResponseModel?> categoryUpdate(
      String title, String parentType, int parentId, int id) async {
    _authManager.bringToken();
    final token = _authManager.token;
    categoryResponseModel = await _categoryRepository.categoryUpdate(
        token!,
        CategoryUpdateRequestModel(
            title: title, parentType: parentType, parentId: parentId),
        id);
    final newToken = categoryResponseModel!.result!.token!;
    _authManager.enterToken(newToken);
  }

  Future<CategoryResponseModel?> categoryDelete(int id) async {
    _authManager.bringToken();
    final token = _authManager.token;
    categoryResponseModel = await _categoryRepository.categoryDelete(
        token!, CategoryCreateRequestModel(), id);
    final newToken = categoryResponseModel!.result!.token;
    _authManager.enterToken(newToken);
  }

  /// Category Update
  AwesomeDialog categoryUpdateMethod(BuildContext context, int index) {
    return AwesomeDialogWidget().awesomeDialog(
      context,
      btnOkOnPress: () async {
        if (titleController.text.isEmpty || titleController.text == null) {
          CategoryMessages.categoryUpdateTittleFail();
        }
        else if(categoryUpdateFormKey.currentState!.validate() == false){
          CategoryMessages.categoryDropFail();

        }
        else {
          Get.back();
          await categoryUpdate(
              titleController.text,
              _settingsController.selectedParentType.value,
              int.parse(_settingsController.selectedCategoryId.value),
              categoryListTask[index].id!);

          await categoryList();
          titleController.text = '';
        }
      },
      btnCancelOnPress: () {
        Get.back();
        titleController.text = '';
      },
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key : categoryUpdateFormKey,
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
                    '${categoryListTask[index].title}',
                    FontAwesomeIcons.question),
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
            Obx(() {
              if (_settingsController.selectedParentType.value == 'child') {
                return Obx(() => FutureBuilder(
                    future: _settingsController.getCategoryID(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return
                           DropdownButtonFormField<String>(

                            validator: (value){
                              return (value == null || value.isEmpty)
                                  ? 'Lütfen Kategori Seçiniz'
                                  : null;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0))),
                            hint: Text('Lütfen Kategori Belirleyin'),
                            onChanged: (String? newId) {
                              _settingsController.selectedCategoryId.value =
                                  newId!;
                            },
                            items: categoryListTask.map((map) {
                              return DropdownMenuItem<String>(
                                  value: map.id.toString(),
                                  child: Text("${map.title}"));
                            }).toList(),
                          );

                      } else {
                        return const Text("Liste Bulunamıyor");
                      }
                    }));
              } else {
                return const Text("");
              }
            })
          ],
        ),
      ),
    );
  }

  /// Category Create
  AwesomeDialog categoryCreateMethod(BuildContext context) {
    return AwesomeDialogWidget().awesomeDialog(
      context,
      btnOkOnPress: () async {
        if (titleController.text.isEmpty || titleController.text == null) {
          CategoryMessages.categoryCreateTitleFail();
        }else if(categoryCreateFormKey.currentState!.validate() == false){
          CategoryMessages.categoryDropFail();
        }


        else {
          Get.back();
          Get.off(CategoryView());
          await categoryCreate(
              titleController.text,
              _settingsController.selectedParentType.value,
              int.parse(_settingsController.selectedCategoryId.value));

          await categoryList();
          titleController.text = '';
          _settingsController.selectedParentType.value = 'parent';
        }
      },
      btnCancelOnPress: () {
        Get.back();
        titleController.text = '';
        _settingsController.selectedParentType.value = 'parent';
      },
      body: Form(
        key: categoryCreateFormKey,
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
                      'Başlık?', FontAwesomeIcons.envelopeOpenText)),
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
            Obx(() {
              if (_settingsController.selectedParentType.value == 'child') {
                return Obx(() => FutureBuilder(
                    future: _settingsController.getCategoryID(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return  DropdownButtonFormField<String>(
                            validator: (value){
                              return (value == null || value.isEmpty)
                                  ? 'Lütfen Kategori Seçiniz'
                                  : null;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0))),
                            hint: const Text('Kategori seçiniz'),
                            onChanged: (String? newId) {
                              _settingsController.selectedCategoryId.value =
                                  newId!;
                            },
                            items: categoryListTask.map((map) {
                              return DropdownMenuItem<String>(

                                  value: map.id.toString(),
                                  child: Text("${map.title}"));
                            }).toList(),
                          );

                      } else {
                        return const Text("Liste Bulunamıyor");
                      }
                    }));
              } else {
                return const Text("");
              }
            })
          ],
        ),
      ),
    );
  }
}
