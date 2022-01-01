import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ronventory_mobile/app/controller/category/category_controller.dart';
import 'package:ronventory_mobile/app/controller/product/product_controller.dart';
import 'package:ronventory_mobile/app/controller/status_group/status_group_controller.dart';
import 'package:ronventory_mobile/app/core/auth_manager.dart';
import 'package:ronventory_mobile/app/model/settings/settings_model.dart';
import 'package:ronventory_mobile/app/repository/settings/settings_repository.dart';

class SettingsController extends GetxController {
  /// Initialize
  late final SettingsRepository _settingsRepository = Get.put(SettingsRepository());
  late final AuthManager _authManager = Get.put(AuthManager());
  late final CategoryController _categoryController = Get.put(CategoryController());
  late final ProductController _productController = Get.put(ProductController());
  late final StatusGroupController _statusGroupController = Get.put(StatusGroupController());

  var dataProcessing = true.obs;

  int? firstCategoryID;

  int? firstProductID;
  int? firstStatusGroupID;

  /// Parent Type
  List<String> parentType = ["parent", "child"];
  final selectedParentType = 'parent'.obs;

  /// Borrow
  late TextEditingController borrowDescriptionController,
      borrowStartDateController,
      borrowEndDateController;

  /// Status
  final selectedGroupID = "1".obs;

  /// User
  final selectedUser = 'Mehmet HAKKIOĞLU'.obs;
  final selectedUserId = '1'.obs;
  final userName = ''.obs;
  final userEmail = ''.obs;
  final isObscure = true.obs;

  /// Category
  final selectedCategoryId = "1".obs;

  /// Department
  final selectedDepartmentId = "1".obs;

  ///

  /// Product
  late TextEditingController productTitleController,
      productPriceController,
      productSerialNumberController;
  final productPrice = "10".obs;
  final selectedProductId = '1'.obs;

  /// Settings
  var settingsList = <SidebarItem>[].obs;

  /// Model
  SettingsModel? settingsModel;

  @override
  void onInit() {
    super.onInit();

    /// Product
    productTitleController = TextEditingController();
    productPriceController = TextEditingController();
    productSerialNumberController = TextEditingController();

    /// Borrow
    borrowDescriptionController = TextEditingController();
    borrowStartDateController = TextEditingController();
    borrowEndDateController = TextEditingController();
  }

  Future<SettingsModel?> getSettings() async {
    dataProcessing.value = true;
    await _authManager.bringToken();
    final token = _authManager.token;
    settingsModel = await _settingsRepository.getSettings(token!);
    if (settingsModel != null) {
      settingsList.assignAll(settingsModel!.sidebar!);
    }
    userName.value = settingsModel!.userInfo!.name!;
    userEmail.value = settingsModel!.userInfo!.email!;
    dataProcessing.value = false;
  }

  void setSelectedParentType(String value) {
    selectedParentType.value = value;
  }

  void setSelectedGroupId(String value) {
    selectedGroupID.value = value;
  }

  void setSelectedUser(String value) {
    selectedUser.value = value;
  }

  void setSelectedUserId(String value) {
    selectedUserId.value = value;
  }

  void setSelectedCategoryId(String value) {
    selectedCategoryId.value = value;
  }

  void setSelectedDepartmentId(String value) {
    selectedDepartmentId.value = value;
  }

  void setSelectedProductId(String value) {
    selectedProductId.value = value;
  }

  Future getCategoryID() async {
    firstCategoryID = _categoryController.categoryListTask[0].id;
    return selectedCategoryId.value = firstCategoryID.toString();
  }

  Future getProductID() async {
    firstProductID = _productController.productListTask[0].id;
    return selectedProductId.value = firstProductID.toString();
  }

  Future getGroupID() async {
    firstStatusGroupID = _statusGroupController.statusGroupListTask[0].id;
    return selectedGroupID.value = firstStatusGroupID.toString();
  }
}
