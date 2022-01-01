import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
import 'package:ronventory_mobile/app/general/text/app_text.style.dart';
import 'package:ronventory_mobile/app/view/borrow/borrow_view.dart';
import 'package:ronventory_mobile/app/view/category/category_view.dart';
import 'package:ronventory_mobile/app/view/department/department_view.dart';
import 'package:ronventory_mobile/app/view/home/home_view.dart';
import 'package:ronventory_mobile/app/view/permission/permission_view.dart';
import 'package:ronventory_mobile/app/view/product/product_view.dart';
import 'package:ronventory_mobile/app/view/status/status_view.dart';
import 'package:ronventory_mobile/app/view/status_group/status_group_view.dart';
import 'package:ronventory_mobile/app/view/user/user_view.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  late UserController _userController;
  late SettingsController _settingsController;
  late CategoryController _categoryController;
  late DepartmentController _departmentController;
  late AuthManager _authManager;
  late ProductController _productController;
  late BorrowController _borrowController;
  late StatusGroupController _statusGroupController;
  late StatusController _statusController;
  late PermissionController _permissionController;


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
    _borrowController = Get.put(BorrowController());

    /// Status Group
    _statusGroupController = Get.put(StatusGroupController());

    /// Status
    _statusController = Get.put(StatusController());

    /// Permission
    _permissionController = Get.put(PermissionController());
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Obx(
          () => UserAccountsDrawerHeader(
            accountName: Text(_settingsController.userName.value),
            accountEmail: Text(_settingsController.userEmail.value),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  "assets/avatar.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(15.0)),
              color: Colors.black,
            ),
          ),
        ),
        Expanded(
          child: Obx(
            () => ListView.builder(
              itemCount: _settingsController.settingsList.length,
              itemBuilder: (BuildContext context, int index) {
                if (_settingsController.settingsList[index].child == null) {
                  return ListTile(
                    title: Text(
                        "${_settingsController.settingsList[index].title}"),
                  );
                } else {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        Get.off(HomeView());
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 38),
                      child: DropdownButton(
                          borderRadius: BorderRadius.circular(10.0),
                          underline: Container(),
                          dropdownColor: Colors.white,
                          hint: Container(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text(
                                  '${_settingsController.settingsList[index].title}')),
                          icon: _settingsController
                                  .settingsList[index].child!.isNotEmpty
                              ? const FaIcon(
                                  FontAwesomeIcons.angleDown,
                                  color: Colors.grey,
                                )
                              : null,
                          iconSize: 24,
                          elevation: 0,
                          onChanged: (String? newValue) {
                            setState(() {
                              _settingsController.settingsList[index]
                                  .child![index].title = newValue!;
                            });
                          },
                          items: _settingsController.settingsList[index].child!
                              .map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              value: value.title,
                              child: GestureDetector(
                                onTap: () async {
                                  switch (value.route) {
                                    case "department.read":
                                      Get.off(DepartmentView());
                                      break;
                                    case "category.read":
                                      Get.off(CategoryView());
                                      break;
                                    case "borrow.read":
                                      Get.off(BorrowView());

                                      break;
                                    case "product.read":
                                      Get.off(ProductView());
                                      break;
                                    case "product.create":
                                      _productController
                                          .productCreateMethod(context)
                                          .show();
                                      break;
                                    case "department.create":
                                      _departmentController
                                          .departmentCreateMethod(context)
                                          .show();
                                      break;
                                    case "category.create":
                                      _categoryController
                                          .categoryCreateMethod(context)
                                          .show();
                                      break;

                                    case "permission.read":
                                      Get.off(PermissionView());
                                      break;

                                    case "user.read":
                                      Get.off(UserView());
                                      break;

                                    case "user.create":
                                      _userController
                                          .userCreateMethod(context)
                                          .show();
                                      break;

                                    case "borrow.create":
                                      _borrowController
                                          .borrowCreateMethod(context)
                                          .show();
                                      break;

                                    case "statusGroup.read":
                                      Get.off(StatusGroupView());
                                      break;

                                    case "statusGroup.create":
                                      _statusGroupController
                                          .statusGroupCreateMethod(context)
                                          .show();
                                      break;

                                    case "status.read":
                                      Get.off(StatusView());
                                      break;

                                    case "status.create":
                                      _statusController
                                          .statusCreateMethod(context)
                                          .show();
                                      break;
                                  }
                                },
                                child: SizedBox(
                                  width: Get.width / 1.6,
                                  child: Text(
                                    value.title!,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            );
                          }).toList()),
                    ),
                  );
                }
              },
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () => _authManager.logOut(),
              label: const Text('Oturumu Kapat'),
              style: signOutStyle,
              icon: const FaIcon(
                FontAwesomeIcons.signOutAlt,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    ));
  }
}

final ButtonStyle signOutStyle = ElevatedButton.styleFrom(
    primary: Colors.black,
    minimumSize: const Size(30, 40),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16))),
    textStyle: AppTextStyle().kTextStyleSignOut);
