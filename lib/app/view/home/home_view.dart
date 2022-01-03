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
    return Obx(
      () => Scaffold(
        drawer: _settingsController.dataProcessing.value == false
            ? SideBar()
            : null,
        appBar: AppBar(
          title: Text(
            "Ödünç Aldıklarım",
            style: AppTextStyle().kTextStyleFourteenWithThemeColor,
          ),
          backgroundColor: AppColors().kAppBarBackground,
        ),
        body: Obx(
          () => controller.myBorrowListTask.isNotEmpty
              ? Skeleton(
                  isLoading: controller.dataProcessing.value,
                  skeleton: SkeletonListView(),
                  child: _settingsController.settingsModel != null
                      ? ListView.builder(
                          itemCount: controller.myBorrowListTask.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CardWidget(
                              title: controller
                                      .myBorrowListTask[index].productId ??
                                  'null',
                              borderColor: Colors.white,
                              shadowColor: Colors.white,
                              children: [
                                Text(
                                  controller.myBorrowListTask[index].userId ??
                                      'null',
                                  style: AppTextStyle().kTextStyleEmail,
                                ),
                              ],
                            );
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
                )
              : Container(
            padding: const EdgeInsets.all(2),
            height: Get.height / 8,
            child: Card(
                elevation: 2,
                color: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                      color: Colors.red,
                    )),
                child: const Center(
                  child: ListTile(
                    title: Text(
                      'Uyarı',
                      style: TextStyle(color: Colors.red,fontSize: 20),
                    ),
                    subtitle: Text('Ödünç aldığınız herhangi bir ürün bulunamadı')
                  ),
                )),
          )
        ),
      ),
    );
  }
}
