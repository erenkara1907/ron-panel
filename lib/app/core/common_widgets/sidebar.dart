import 'package:awesome_dialog/awesome_dialog.dart';
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
import 'package:ronventory_mobile/app/core/common_widgets/input_decoration.widget.dart';
import 'package:ronventory_mobile/app/general/color/app_colors.dart';
import 'package:ronventory_mobile/app/general/text/app_text.style.dart';
import 'package:ronventory_mobile/app/messages/borrow/borrow_messages.snackbar.dart';
import 'package:ronventory_mobile/app/messages/category/category_messages.snackbar.dart';
import 'package:ronventory_mobile/app/messages/department/department_messages.sncakbar.dart';
import 'package:ronventory_mobile/app/messages/product/product_messages.snackbar.dart';
import 'package:ronventory_mobile/app/messages/status_group/status_group_messages.snackbar.dart';
import 'package:ronventory_mobile/app/messages/user/user_messages.snackbar.dart';
import 'package:ronventory_mobile/app/view/borrow/borrow_view.dart';
import 'package:ronventory_mobile/app/view/category/category_view.dart';
import 'package:ronventory_mobile/app/view/department/department_view.dart';
import 'package:ronventory_mobile/app/view/home/home_view.dart';
import 'package:ronventory_mobile/app/view/permission/permission_view.dart';
import 'package:ronventory_mobile/app/view/product/product_view.dart';
import 'package:ronventory_mobile/app/view/status/status_view.dart';
import 'package:ronventory_mobile/app/view/status_group/status_group_view.dart';
import 'package:ronventory_mobile/app/view/user/user_view.dart';
import 'package:intl/intl.dart';

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

  DateTime? pickedDate;

  DateTime? pickedEndDate;

  DateTime? dateData;
  DateTime? dateEndData;
  String? formattedDate = '';
  String? formattedEndDate = '';

  GlobalKey<FormState> categoryFormKey = GlobalKey();
  GlobalKey<FormState> departmentFormKey = GlobalKey();
  GlobalKey<FormState> productFormKey = GlobalKey();
  GlobalKey<FormState> userFormKey = GlobalKey();
  GlobalKey<FormState> borrowFormKey = GlobalKey();
  GlobalKey<FormState> statusGroupFormKey = GlobalKey();
  GlobalKey<FormState> statusFormKey = GlobalKey();

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

    ///DateTime
    pickedDate = DateTime.now();
    pickedEndDate = DateTime.now();

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
                                      productCreateMethod(context).show();
                                      break;
                                    case "department.create":
                                      departmentCreateMethod(context).show();
                                      break;
                                    case "category.create":
                                      categoryCreateMethod(context).show();
                                      break;

                                    case "permission.read":
                                      Get.off(PermissionView());
                                      break;

                                    case "user.read":
                                      Get.off(UserView());
                                      break;

                                    case "user.create":
                                      userCreateMethod(context).show();
                                      break;

                                    case "borrow.create":
                                      borrowCreateMethod(context).show();
                                      break;

                                    case "statusGroup.read":
                                      Get.off(StatusGroupView());
                                      break;

                                    case "statusGroup.create":
                                      statusGroupCreateMethod(context).show();
                                      break;

                                    case "status.read":
                                      Get.off(StatusView());
                                      break;

                                    case "status.create":
                                      statusCreateMethod(context).show();
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

  AwesomeDialog categoryCreateMethod(BuildContext context) {
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
        key: categoryFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: TextFormField(
                  controller: _categoryController.titleController,
                  style: TextStyle(color: AppColors().kTextColor),
                  cursorColor: AppColors().kCursorColor,
                  decoration: const InputDecorationWidget().inputDecoration(
                      'Başlık?', FontAwesomeIcons.envelopeOpenText)),
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
                        return SizedBox(
                          width: Get.width / 1.7,
                          height: Get.height / 14,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0))),
                            hint: const Text('Kategori seçiniz'),
                            onChanged: (String? newId) {
                              _settingsController.selectedCategoryId.value =
                                  newId!;
                            },
                            items:
                                _categoryController.categoryListTask.map((map) {
                              return DropdownMenuItem<String>(
                                  value: map.id.toString(),
                                  child: Text("${map.title}"));
                            }).toList(),
                          ),
                        );
                      } else {
                        return Text("Liste Bulunamıyor");
                      }
                    }));
              } else {
                return Text("");
              }
            })
          ],
        ),
      ),
      btnCancelOnPress: () {
        _categoryController.titleController.text = '';
        _settingsController.selectedParentType.value = 'parent';
        Get.back();
      },
      btnOkOnPress: () async {
        if (_categoryController.titleController.text.isEmpty ||
            _categoryController.titleController.text == null) {
          CategoryMessages.categoryCreateTitleFail();
        } else {
          await _categoryController.categoryCreate(
              _categoryController.titleController.text,
              _settingsController.selectedParentType.value,
              int.parse(_settingsController.selectedCategoryId.value));

          _categoryController.titleController.text = '';
          _settingsController.selectedParentType.value = 'parent';
          await _categoryController.categoryList();
          Get.off(CategoryView());
        }
      },
    );
  }

  AwesomeDialog departmentCreateMethod(BuildContext context) {
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
        key: departmentFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: TextFormField(
                controller: _departmentController.titleController,
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
                            _departmentController.departmentListTask.map((map) {
                          return DropdownMenuItem(
                            value: map.id.toString(),
                            child: Text("${map.title}")

                          );
                        }).toList(),
                      ),
                    )
                  : Text(''),
            ),
          ],
        ),
      ),
      btnCancelOnPress: () {
        _departmentController.titleController.text = '';
        _settingsController.selectedParentType.value = 'parent';
        Get.back();
      },
      btnOkOnPress: () async {
        if (_departmentController.titleController.text == null ||
            _departmentController.titleController.text.isEmpty) {
          DepartmentMessages.departmentCreateTitleUpdateFail();
        } else {
          await _departmentController.departmentCreate(
              _departmentController.titleController.text,
              _settingsController.selectedParentType.value,
              int.parse(_settingsController.selectedDepartmentId.value),
              int.parse(_settingsController.selectedUserId.value));
          _departmentController.titleController.text = '';
          _settingsController.selectedParentType.value = 'parent';
          await _departmentController.departmentList();
          Get.off(DepartmentView());
        }
      },
    );
  }

  AwesomeDialog productCreateMethod(BuildContext context) {
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
        key: productFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: TextFormField(
                controller: _settingsController.productTitleController,
                style: TextStyle(color: AppColors().kTextColor),
                cursorColor: AppColors().kCursorColor,
                decoration: InputDecorationWidget()
                    .inputDecoration('Ürün Adı', FontAwesomeIcons.font),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: TextFormField(
                controller: _settingsController.productPriceController,
                style: TextStyle(color: AppColors().kTextColor),
                cursorColor: AppColors().kCursorColor,
                decoration: InputDecorationWidget().inputDecoration(
                    'Fiyat (Opsiyonel)', FontAwesomeIcons.euroSign),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: TextFormField(
                controller: _settingsController.productSerialNumberController,
                style: TextStyle(color: AppColors().kTextColor),
                cursorColor: AppColors().kCursorColor,
                decoration: InputDecorationWidget().inputDecoration(
                    'Seri Numarası', FontAwesomeIcons.sortNumericUp),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(
              () => Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: FutureBuilder(
                    future: _settingsController.getCategoryID(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return SizedBox(
                          width: Get.width/1.7,
                          height: Get.height/14,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0))),
                            hint: Text("Kategori seçiniz"),
                            onChanged: (String? newValue) {
                              _settingsController
                                  .setSelectedCategoryId(newValue!);
                            },
                            items:
                                _categoryController.categoryListTask.map((map) {
                              return DropdownMenuItem(
                                value: map.id.toString(),
                                child: Text("${map.title}"),
                              );
                            }).toList(),
                          ),
                        );
                      } else {
                        return Text("Listeye boş olduğu için ulaşılamıyor");
                      }
                    },
                  )),
            ),
          ],
        ),
      ),
      btnCancelOnPress: () {
        _settingsController.productTitleController.text = '';
        _settingsController.productPriceController.text = '';
        _settingsController.productSerialNumberController.text = '';
        Get.back();
      },
      btnOkOnPress: () async {
        if (_settingsController.productTitleController.text == null ||
            _settingsController.productTitleController.text.isEmpty) {
          ProductMessages.productCreateTitleFail();
        } else if (_settingsController.productSerialNumberController.text ==
                null ||
            _settingsController.productSerialNumberController.text.isEmpty) {
          ProductMessages.productCreateSerialNumberFail();
        } else {
          _settingsController.productPrice.value ==
              _settingsController.productPriceController.text;
          await _productController.productCreate(
            _settingsController.productTitleController.text,
            int.parse(_settingsController.selectedCategoryId.value),
            _settingsController.productPrice.value,
            _settingsController.productSerialNumberController.text,
          );
          _settingsController.productTitleController.text = '';
          _settingsController.productPriceController.text = '';
          _settingsController.productSerialNumberController.text = '';
          _settingsController.selectedParentType.value = 'parent';
          await _productController.productList();
          Get.off(ProductView());
        }
      },
    );
  }

  AwesomeDialog borrowCreateMethod(BuildContext context) {
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
        key: borrowFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: TextFormField(
                controller: _settingsController.borrowDescriptionController,
                style: TextStyle(color: AppColors().kTextColor),
                cursorColor: AppColors().kCursorColor,
                decoration: InputDecorationWidget()
                    .inputDecoration('Açıklama', FontAwesomeIcons.bookOpen),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Başlangıç Tarihi :"),
                    ElevatedButton(
                      onPressed: () {
                        _selectDate();
                      },
                      child: const Icon(
                        FontAwesomeIcons.calendar,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.grey.shade900),
                    )
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Bitiş Tarihi :"),
                    ElevatedButton(
                      onPressed: () {
                        _selectEndDate();
                      },
                      child: const Icon(
                        FontAwesomeIcons.calendar,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.grey.shade900),
                    )
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
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
                      child: Center(
                          child: Center(
                        child: SizedBox(
                            width: Get.width / 2, child: Text("${map.name}")),
                      )),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Obx(
              () => Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: FutureBuilder(
                    future: _settingsController.getProductID(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return DropdownButtonFormField<String>(

                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0))),
                          hint: const Text('Ürün seçiniz'),
                          onChanged: (String? newValue) {
                            _settingsController.setSelectedProductId(newValue!);
                          },
                          items: _productController.productListTask.map((map) {
                            return DropdownMenuItem(
                              value: map.id.toString(),
                              child: Center(
                                  child: SizedBox(
                                      width: Get.width / 2,
                                      child: Text(
                                        "${map.title}",
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(fontSize: 13),
                                      ))),
                            );
                          }).toList(),
                        );
                      } else {
                        return Text("Listeye boş olduğu için ulaşılamıyor");
                      }
                    },
                  )),
            ),
          ],
        ),
      ),
      btnCancelOnPress: () {
        _settingsController.borrowDescriptionController.text = '';
        Get.back();
      },
      btnOkOnPress: () async {
        if (_settingsController.borrowDescriptionController.text.isEmpty ||
            _settingsController.borrowDescriptionController.text == null) {
          BorrowMessages.borrowCreateDescriptionFail();
          _settingsController.borrowDescriptionController.text = '';
        } else if (formattedDate! == '' || formattedDate!.isEmpty) {
          BorrowMessages.borrowCreateDateFail();
          _settingsController.borrowDescriptionController.text = '';
        }

        else {
          await _borrowController.borrowCreate(
            int.parse(_settingsController.selectedUserId.value),
            int.parse(_settingsController.selectedProductId.value),
            _settingsController.borrowDescriptionController.text,
            formattedDate!,
            _settingsController.borrowEndDateController.text,
          );
          _settingsController.borrowDescriptionController.text = '';
          await _borrowController.borrowList();
          Get.off(BorrowView());
        }
      },
    );
  }

  AwesomeDialog userCreateMethod(BuildContext context) {
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
                controller: _userController.nameController,
                style: TextStyle(color: AppColors().kTextColor),
                cursorColor: AppColors().kCursorColor,
                decoration: InputDecorationWidget()
                    .inputDecoration('Kullanıcı Adı?', FontAwesomeIcons.user),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: TextFormField(
                controller: _userController.emailController,
                style: TextStyle(color: AppColors().kTextColor),
                cursorColor: AppColors().kCursorColor,
                decoration: InputDecorationWidget()
                    .inputDecoration('Email?', FontAwesomeIcons.mailBulk),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Obx(
                  () => TextFormField(
                    obscureText: _settingsController.isObscure.value,
                    controller: _userController.passwordController,
                    style: TextStyle(color: AppColors().kTextColor),
                    cursorColor: AppColors().kCursorColor,
                    decoration: InputDecorationWidget().inputDecoration(
                      'Parola?',
                      FontAwesomeIcons.lock,
                      suffixIcon: IconButton(
                        onPressed: () {
                          _settingsController.isObscure.value =
                              !_settingsController.isObscure.value;
                        },
                        icon: _settingsController.isObscure.value == true
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
                )),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      btnCancelOnPress: () {
        _userController.nameController.text = '';
        _userController.emailController.text = '';
        _userController.passwordController.text = '';
        Get.back();
      },
      btnOkOnPress: () async {
        if (_userController.nameController.text.isEmpty) {
          UserMessages.userCreateNameFail();
        } else if (_userController.emailController.text.isEmpty ||
            _userController.emailController.text.length < 6) {
          UserMessages.userCreateEmailFail();
        } else if (!_userController.emailController.text.contains("@")) {
          UserMessages.userCreateEmailContainFail();
        } else if (_userController.passwordController.text.length < 6) {
          UserMessages.userCreatePasswordFail();
        } else {
          UserMessages.userCreateSuccess();
          await _userController.userCreate(
              _userController.emailController.text,
              _userController.passwordController.text,
              _userController.nameController.text);
          _userController.nameController.text = '';
          _userController.emailController.text = '';
          _userController.passwordController.text = '';
          await _userController.userList();
          Get.off(UserView());
        }
      },
    );
  }

  AwesomeDialog statusGroupCreateMethod(BuildContext context) {
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
        key: statusGroupFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: TextFormField(
                controller: _statusGroupController.titleController,
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
                controller: _statusGroupController.optionsController,
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
      btnCancelOnPress: () {
        _statusGroupController.titleController.text = '';
        _statusGroupController.optionsController.text = '';
        Get.back();
      },
      btnOkOnPress: () async {
        if (_statusGroupController.titleController.text == null ||
            _statusGroupController.titleController.text.isEmpty) {
          StatusGroupMessages.statusGroupCreateTitleFail();
        } else if (_statusGroupController.optionsController.text == null ||
            _statusGroupController.optionsController.text.isEmpty) {
        } else {
          await _statusGroupController.statusGroupCreate(
            _statusGroupController.titleController.text,
            _statusGroupController.optionsController.text,
          );
          _statusGroupController.titleController.text = '';
          _statusGroupController.optionsController.text = '';
          await _statusGroupController.statusGroupList();
          Get.off(StatusGroupView());
        }
      },
    );
  }

  AwesomeDialog statusCreateMethod(BuildContext context) {
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
        key: statusGroupFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: TextFormField(
                controller: _statusController.titleController,
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
                controller: _statusController.optionsController,
                style: TextStyle(color: AppColors().kTextColor),
                cursorColor: AppColors().kCursorColor,
                decoration: InputDecorationWidget()
                    .inputDecoration('Settings', FontAwesomeIcons.cogs),
              ),
            ),SizedBox(height: 15,),

            Obx(() => SizedBox(
              width: Get.width/1.7,
              height: Get.height/14,
              child: FutureBuilder(
                future: _settingsController.getGroupID(),
                builder: (context,snapshot){
                  if(snapshot.hasData){
                   return DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))
                      ),
                      hint: const Text('Statü Grup seçiniz'),
                      onChanged: (String? newID) {
                        setState(() {
                          _settingsController.setSelectedGroupId(newID!);
                        });
                      },
                      items: _statusGroupController.statusGroupListTask.map((map) {
                        return DropdownMenuItem<String>(
                          value: map.id.toString(),
                          child: Text("${map.title}"),
                        );
                      }).toList(),
                    );
                  }else{
                    return Text("Liste bulunamadı");
                  }

                },
              )
            ))
          ],
        ),
      ),
      btnCancelOnPress: () {
        _statusController.titleController.text = '';
        _statusController.optionsController.text = '';
        Get.back();
      },
      btnOkOnPress: () async {
        if (_statusController.titleController.text == null ||
            _statusController.titleController.text.isEmpty) {
          StatusGroupMessages.statusGroupCreateTitleFail();
        } else if (_statusController.optionsController.text == null ||
            _statusController.optionsController.text.isEmpty) {
          StatusGroupMessages.statusGroupCreateSettingsFail();
        } else {
          await _statusController.statusCreate(
              _statusController.titleController.text,
              _statusController.optionsController.text,
              int.parse(_settingsController.selectedGroupID.value));
          _statusController.titleController.text = '';
          _statusController.optionsController.text = '';
          await _statusController.statusList();
          Get.off(StatusView());
        }
      },
    );
  }

  _selectDate() async {
    dateData = await showDatePicker(
      context: context,
      locale: const Locale('tr', 'TR'),
      initialDate: pickedDate!,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 10),
      builder: (context, child) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SizedBox(
                  height: 500,
                  width: 500,
                  child: Theme(
                      data: ThemeData.dark().copyWith(
                        colorScheme: ColorScheme.dark(
                          primary: Colors.white,
                          onPrimary: Colors.grey.shade900,
                          surface: Colors.grey.shade900,
                          onSurface: Colors.white,
                        ),
                        dialogBackgroundColor: Colors.grey.shade900,
                      ),
                      child: child!),
                ),
              ),
            ],
          ),
        );
      },
    );

    if (dateData != null) {
      pickedDate = dateData!;
      formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateData!);
    }
  }

  _selectEndDate() async {
    dateEndData = await showDatePicker(
      context: context,
      locale: const Locale('tr', 'TR'),
      initialDate: pickedEndDate!,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 10),
      builder: (BuildContext context, Widget? child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SizedBox(
                  width: 500,
                  height: 500,
                  child: Theme(
                    data: ThemeData.dark().copyWith(
                      colorScheme: ColorScheme.dark(
                        primary: Colors.white,
                        onPrimary: Colors.grey.shade900,
                        surface: Colors.grey.shade900,
                        onSurface: Colors.white,
                      ),
                      dialogBackgroundColor: Colors.grey.shade900,
                    ),
                    child: child!,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    if (dateEndData != null) {
      pickedEndDate = dateEndData!;
      formattedEndDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateEndData!);
    }
  }
}

final ButtonStyle signOutStyle = ElevatedButton.styleFrom(
    primary: Colors.black,
    minimumSize: const Size(30, 40),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16))),
    textStyle: AppTextStyle().kTextStyleSignOut);
