import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ronventory_mobile/app/controller/borrow/borrow_controller.dart';
import 'package:ronventory_mobile/app/controller/category/category_controller.dart';
import 'package:ronventory_mobile/app/controller/department/department_controller.dart';
import 'package:ronventory_mobile/app/controller/permission/permission_controller.dart';
import 'package:ronventory_mobile/app/controller/product/product_controller.dart';
import 'package:ronventory_mobile/app/controller/settings/settings_controller.dart';
import 'package:ronventory_mobile/app/controller/status/status_controller.dart';
import 'package:ronventory_mobile/app/controller/status_group/status_group_controller.dart';
import 'package:ronventory_mobile/app/controller/user/user_controller.dart';
import 'package:ronventory_mobile/app/core/auth_manager.dart';
import 'package:ronventory_mobile/app/core/common_widgets/sidebar.dart';
import 'package:ronventory_mobile/app/general/color/app_colors.dart';
import 'package:ronventory_mobile/app/general/text/app_text.style.dart';
class MyHomeView extends StatefulWidget {
  const MyHomeView({Key? key}) : super(key: key);

  @override
  _MyHomeViewState createState() => _MyHomeViewState();

}

class _MyHomeViewState extends State<MyHomeView> {

  late UserController _userController;

  late SettingsController _settingsController;

  late CategoryController _categoryController;

  late DepartmentController _departmentController;

  late AuthManager _authManager;

  late ProductController _productController;

  late BorrowController controller;

  late StatusGroupController _statusGroupController;

  late StatusController _statusController;

  late PermissionController _permissionController;

  Future<void> getData() async {
    await _authManager.bringToken();
    await _settingsController.getSettings();
    await controller.borrowList();
    await _categoryController.categoryList();
    await _departmentController.departmentList();
    await _statusGroupController.statusGroupList();
    await _statusController.statusList();
    await _productController.productList();
    await _userController.userList();
    await _permissionController.permissionList();
  }

  @override
  void initState() {
    super.initState();


    _authManager = Get.put(AuthManager());

    /// User
    _userController = Get.put(UserController());

    /// Settings
    _settingsController = Get.put(SettingsController());

    /// Category
    _categoryController = Get.put(CategoryController());

    /// Department
    _departmentController = Get.put(DepartmentController());

    /// Product
    _productController = Get.put(ProductController());

    /// Borrow
    controller = Get.put(BorrowController());

    /// Status Group
    _statusGroupController = Get.put(StatusGroupController());

    /// Status
    _statusController = Get.put(StatusController());

    /// Permission
    _permissionController = Get.put(PermissionController());

    getData();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),

      appBar: AppBar(
        title: Text(
          "Ana Sayfa",
          style: AppTextStyle().kTextStyleFourteenWithThemeColor,
        ),
        backgroundColor: AppColors().kAppBarBackground,
      ),
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          child: Text("Welcome to RonPanel" ,style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
