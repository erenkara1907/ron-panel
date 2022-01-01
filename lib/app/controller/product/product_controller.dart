import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ronventory_mobile/app/controller/category/category_controller.dart';
import 'package:ronventory_mobile/app/controller/settings/settings_controller.dart';
import 'package:ronventory_mobile/app/core/auth_manager.dart';
import 'package:ronventory_mobile/app/core/common_widgets/awesome_dialog.widget.dart';
import 'package:ronventory_mobile/app/core/common_widgets/input_decoration.widget.dart';
import 'package:ronventory_mobile/app/general/color/app_colors.dart';
import 'package:ronventory_mobile/app/messages/product/product_messages.snackbar.dart';
import 'package:ronventory_mobile/app/model/product/product_model.dart';
import 'package:ronventory_mobile/app/model/product/submodel/product_create_request_model.dart';
import 'package:ronventory_mobile/app/model/product/submodel/product_response_model.dart';
import 'package:ronventory_mobile/app/model/product/submodel/product_update_request_model.dart';
import 'package:ronventory_mobile/app/repository/product/product_repository.dart';
import 'package:ronventory_mobile/app/view/product/product_view.dart';
import 'package:ronventory_mobile/app/view/user/user_view.dart';

class ProductController extends GetxController {
  late final AuthManager _authManager;
  late final ProductRepository _productRepository;
  late final SettingsController _settingsController = Get.put(SettingsController());
  late final CategoryController _categoryController = Get.put(CategoryController());

  var dataProcessing = false.obs;

  ProductModel? productModel;
  ProductResponseModel? productResponseModel;

  GlobalKey<FormState> productFormKey = GlobalKey();

  var productListTask = <ConclusionProduct>[].obs;
  late TextEditingController titleController;

  @override
  void onInit() {
    super.onInit();
    _productRepository = Get.put(ProductRepository());
    _authManager = Get.put(AuthManager());
    titleController = TextEditingController();
  }

  Future<ProductModel?> productList() async {
    dataProcessing.value = true;
    _authManager.bringToken();
    final token = _authManager.token;
    productModel = await _productRepository.productList(token!);
    productListTask.assignAll(productModel!.result!.conclusion!);
    dataProcessing.value = false;
    final newToken = productModel!.result!.token!;
    _authManager.enterToken(newToken);
  }

  Future<ProductResponseModel?> productCreate(
      String title, int categoryId, String price, String serialNumber) async {
    _authManager.bringToken();
    final token = _authManager.token;
    productResponseModel = await _productRepository.productCreate(
      token!,
      ProductCreateRequestModel(
        title: title,
        categoryId: categoryId,
        price: price,
        serialNumber: serialNumber,
      ),
    );

    final newToken = productResponseModel!.result!.token;
    _authManager.enterToken(newToken);
  }

  Future<ProductResponseModel?> productDelete(int id) async {
    _authManager.bringToken();
    final token = _authManager.token;
    productResponseModel = await _productRepository.productDelete(
        token!, ProductCreateRequestModel(), id);
    final newToken = productResponseModel!.result!.token;
    _authManager.enterToken(newToken);
  }

  Future<ProductResponseModel?> productUpdate(String title, int id) async {
    _authManager.bringToken();
    final token = _authManager.token;
    productResponseModel = await _productRepository.productUpdate(
      token!,
      ProductUpdateRequestModel(
        title: title,
      ),
      id,
    );
    final newToken = productResponseModel!.result!.token;
    _authManager.enterToken(newToken);
  }

  /// Product Update
  AwesomeDialog productUpdateMethod(BuildContext context, int index) {
    return AwesomeDialogWidget().awesomeDialog(
      context,
      btnOkOnPress: () async {
        if (titleController.text == null || titleController.text.isEmpty) {
          ProductMessages.productCreateTitleUpdateFail();
        } else {
          Get.back();
          await productUpdate(titleController.text, productListTask[index].id!);

          titleController.text = '';
          await productList();
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
                    '${productListTask[index].title}',
                    FontAwesomeIcons.envelopeOpenText),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Product Create
  AwesomeDialog productCreateMethod(BuildContext context) {
    return AwesomeDialogWidget().awesomeDialog(
      context,
      btnOkOnPress: () async {
        if (_settingsController.productTitleController.text == null ||
            _settingsController.productTitleController.text.isEmpty) {
          ProductMessages.productCreateTitleFail();
        } else if (_settingsController.productSerialNumberController.text ==
            null ||
            _settingsController.productSerialNumberController.text.isEmpty) {
          ProductMessages.productCreateSerialNumberFail();
        } else if(productFormKey.currentState?.validate() == false){
          ProductMessages.productCreateDropCategoryFail();
        }

        else {
          Get.back();
          Get.off(ProductView());
          _settingsController.productPrice.value ==
              _settingsController.productPriceController.text;
          await productCreate(
            _settingsController.productTitleController.text,
            int.parse(_settingsController.selectedCategoryId.value),
            _settingsController.productPrice.value,
            _settingsController.productSerialNumberController.text,
          );
          _settingsController.productTitleController.text = '';
          _settingsController.productPriceController.text = '';
          _settingsController.productSerialNumberController.text = '';
          _settingsController.selectedParentType.value = 'parent';
          await productList();
        }
      },
      btnCancelOnPress: (){
        Get.back();
        _settingsController.productTitleController.text = '';
        _settingsController.productPriceController.text = '';
        _settingsController.productSerialNumberController.text = '';
      },
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
                        return DropdownButtonFormField<String>(
                          validator: (value){
                            return (value == null || value.isEmpty)
                                ? 'Lütfen Kategori Seçiniz'
                                : null;
                          },
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
    );
  }
}
