import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ronventory_mobile/app/controller/product/product_controller.dart';
import 'package:ronventory_mobile/app/controller/settings/settings_controller.dart';
import 'package:ronventory_mobile/app/controller/user/user_controller.dart';
import 'package:ronventory_mobile/app/core/auth_manager.dart';
import 'package:ronventory_mobile/app/core/common_widgets/awesome_dialog.widget.dart';
import 'package:ronventory_mobile/app/core/common_widgets/input_decoration.widget.dart';
import 'package:ronventory_mobile/app/general/color/app_colors.dart';
import 'package:ronventory_mobile/app/messages/borrow/borrow_messages.snackbar.dart';
import 'package:ronventory_mobile/app/model/borrow/borrow_model.dart';
import 'package:ronventory_mobile/app/model/borrow/submodel/borrow_request_model.dart';
import 'package:ronventory_mobile/app/model/borrow/submodel/borrow_response_model.dart';
import 'package:ronventory_mobile/app/repository/borrow/borrow_repository.dart';
import 'package:ronventory_mobile/app/view/borrow/borrow_view.dart';
import 'package:intl/intl.dart';

class BorrowController extends GetxController {
  late final AuthManager _authManager;
  late final BorrowRepository _borrowRepository;
  late final SettingsController _settingsController;
  late final ProductController _productController =
      Get.put(ProductController());
  late final UserController _userController = Get.put(UserController());

  var dataProcessing = false.obs;

  DateTime? pickedDate;

  DateTime? dateData;
  DateTime? dateEndData;
  String? formattedDate = '';
  String? formattedEndDate = '';

  DateTime? pickedEndDate;

  BorrowModel? borrowModel;
  BorrowResponseModel? borrowResponseModel;

  GlobalKey<FormState> borrowFormKey = GlobalKey();

  var borrowListTask = <ConclusionBorrow>[].obs;

  @override
  void onInit() async {
    super.onInit();
    _authManager = Get.put(AuthManager());
    _settingsController = Get.put(SettingsController());
    _borrowRepository = Get.put(BorrowRepository());
    pickedDate = DateTime.now();
    pickedEndDate = DateTime.now();
  }

  Future<BorrowModel?> borrowList() async {
    dataProcessing.value = true;
    await _authManager.bringToken();
    final token = _authManager.token;
    borrowModel = await _borrowRepository.borrowList(token!);
    borrowListTask.assignAll(borrowModel!.result!.conclusion!);
    dataProcessing.value = false;
    final newToken = borrowModel!.result!.token!;
    await _authManager.enterToken(newToken);
  }

  Future<BorrowModel?> borrowCreate(int userId, int productId,
      String description, String startDate, dynamic endDate) async {
    _authManager.bringToken();
    final token = _authManager.token;
    if (endDate == null) {
      return null;
    }
    borrowResponseModel = await _borrowRepository.borrowCreate(
      token!,
      BorrowRequestModel(
        userId: userId,
        productId: productId,
        description: description,
        startDate: startDate,
        endDate: endDate,
      ),
    );
    final newToken = borrowResponseModel!.result!.token;
    _authManager.enterToken(newToken);
  }

  /// Borrrow Create
  AwesomeDialog borrowCreateMethod(BuildContext context) {
    return AwesomeDialogWidget().awesomeDialog(
      context,
      btnOkOnPress: () async {
        if (_settingsController.borrowDescriptionController.text.isEmpty ||
            _settingsController.borrowDescriptionController.text == null) {
          BorrowMessages.borrowCreateDescriptionFail();
          _settingsController.borrowDescriptionController.text = '';
        } else if (formattedDate! == '' || formattedDate!.isEmpty) {
          BorrowMessages.borrowCreateDateFail();
          _settingsController.borrowDescriptionController.text = '';
        } else if (borrowFormKey.currentState?.validate() == false) {
          BorrowMessages.borrowCreateFail();
        } else {
          Get.back();
          Get.off(BorrowView());
          await borrowCreate(
            int.parse(_settingsController.selectedUserId.value),
            int.parse(_settingsController.selectedProductId.value),
            _settingsController.borrowDescriptionController.text,
            formattedDate!,
            _settingsController.borrowEndDateController.text,
          );
          _settingsController.borrowDescriptionController.text = '';
          await borrowList();
        }
      },
      btnCancelOnPress: () {
        Get.back();
        _settingsController.borrowDescriptionController.text = '';
      },
      body: Form(
        key: borrowFormKey,
        autovalidateMode: AutovalidateMode.always,
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
                    const Text("Başlangıç Tarihi :"),
                    ElevatedButton(
                      onPressed: () {
                        _selectDate(context);
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
                    const Text("Bitiş Tarihi :"),
                    ElevatedButton(
                      onPressed: () {
                        _selectEndDate(context);
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
                  validator: (value) {
                    return (value == null || value.isEmpty)
                        ? 'Lütfen gerekli alanı doldurunuz'
                        : null;
                  },
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
            const SizedBox(
              height: 15,
            ),
            Obx(
              () => Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: FutureBuilder(
                    future: _settingsController.getProductID(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return DropdownButtonFormField<String>(
                          validator: (value) {
                            return (value == null || value.isEmpty)
                                ? 'Lütfen gerekli alanı doldurunuz'
                                : null;
                          },
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
                        return const Text(
                            "Listeye boş olduğu için ulaşılamıyor");
                      }
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
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

  _selectEndDate(BuildContext context) async {
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
