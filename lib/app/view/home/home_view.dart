import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
import 'package:ronventory_mobile/app/core/common_widgets/card_widget.dart';
import 'package:ronventory_mobile/app/core/common_widgets/sidebar.dart';
import 'package:ronventory_mobile/app/core/common_widgets/try_again.widget.dart';
import 'package:ronventory_mobile/app/general/color/app_colors.dart';
import 'package:ronventory_mobile/app/general/text/app_text.style.dart';
import 'package:skeletons/skeletons.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
    await _categoryController.categoryList();
    await _departmentController.departmentList();
    await _userController.userList();
    await _settingsController.getSettings();
    await _productController.productList();
    await _statusGroupController.statusGroupList();
    await _permissionController.permissionList();
    await controller.borrowList();
    await _statusController.statusList();
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
    return Obx(
        () => Scaffold(
          drawer: _settingsController.dataProcessing.value == false ? SideBar() : null,
          appBar: AppBar(
            title: Text(
              "Ödünç Aldıklarım",
              style: AppTextStyle().kTextStyleFourteenWithThemeColor,
            ),
            backgroundColor: AppColors().kAppBarBackground,
          ),
          body: Obx(
                () => Skeleton(
              isLoading: controller.dataProcessing.value,
              skeleton: SkeletonListView(),
              child: _settingsController.settingsModel != null
                  ? ListView.builder(
                  itemCount: controller.borrowListTask.length,
                  itemBuilder: (BuildContext context, int index) {
                    return controller.borrowListTask[index].userId ==
                        _settingsController.settingsModel!.userInfo!.id
                        ? CardWidget(
                      title:
                      controller.borrowListTask[index].actionCode ??
                          'null',
                      borderColor: Colors.white,
                      shadowColor: Colors.white,
                      children: [
                        Text(
                          controller.borrowListTask[index].startDate ??
                              'null',
                          style: AppTextStyle().kTextStyleEmail,
                        ),
                      ],
                    )
                        : const SizedBox();
                  })
                  : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      color: Colors.white,
                      width: Get.width / 2,
                      height: Get.height / 8,
                    ),
                    Text(
                      'Yükleniyor..',
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 14),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}
