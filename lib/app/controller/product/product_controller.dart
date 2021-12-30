import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ronventory_mobile/app/core/auth_manager.dart';
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

  var dataProcessing = false.obs;

  ProductModel? productModel;
  ProductResponseModel? productResponseModel;

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

  AwesomeDialog productUpdateMethod(BuildContext context, int index) {
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
        btnCancelOnPress: () {
          Get.off(ProductView());
          titleController.text = '';
        },
        btnOkOnPress: () async {
          if(titleController.text == null || titleController.text.isEmpty){
            ProductMessages.productCreateTitleUpdateFail();
          }else{
            await productUpdate(
                titleController.text,
                productListTask[index].id!);

            titleController.text = '';
            await productList();
          }

        });
  }
}
