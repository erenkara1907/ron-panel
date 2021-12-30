import 'package:get/get.dart';
import 'package:ronventory_mobile/app/core/service/product_base.dart';
import 'package:ronventory_mobile/app/messages/product/product_messages.snackbar.dart';
import 'package:ronventory_mobile/app/model/product/product_model.dart';
import 'package:ronventory_mobile/app/model/product/submodel/product_create_request_model.dart';
import 'package:ronventory_mobile/app/model/product/submodel/product_response_model.dart';
import 'package:ronventory_mobile/app/model/product/submodel/product_update_request_model.dart';
import 'package:ronventory_mobile/app/service/product/product_service.dart';

enum AppMode { DEBUG, RELEASE }

class ProductRepository implements ProductBase {
  final ProductService _productService = Get.put(ProductService());

  AppMode appMode = AppMode.RELEASE;

  @override
  Future<ProductResponseModel?> productCreate(String token, ProductCreateRequestModel model) async {
    if (appMode == AppMode.DEBUG) {
      return null;
    } else {
      final response = await _productService.productCreate(token, model);
      if(response!.code == 200){
        await ProductMessages.productCreateSuccess();
        return response;
      }else {
        await ProductMessages.productCreateFail();
      }
    }
  }

  @override
  Future<ProductResponseModel?> productDelete(String token, ProductCreateRequestModel model, int id) async {
    if (appMode == AppMode.DEBUG) {
      return null;
    } else {
      final response = await _productService.productDelete(token, model, id);
      if(response!.code == 200){
        await ProductMessages.productDeleteSuccess();
        return response;
      }else {
        await ProductMessages.productDeleteFail();
      }
    }
  }

  @override
  Future<ProductModel?> productInfo(String token, ProductModel model) async {
    if (appMode == AppMode.DEBUG) {
      return null;
    } else {
      return await _productService.productInfo(token, model);
    }
  }

  @override
  Future<ProductModel?> productList(String token) async {
    if (appMode == AppMode.DEBUG) {
      return null;
    } else {
      final response = await _productService.productList(token);
      if(response!.code == 200){
        return response;
      }
    }
  }

  @override
  Future<ProductResponseModel?> productUpdate(String token, ProductUpdateRequestModel model, int id) async {
    if (appMode == AppMode.DEBUG) {
      return null;
    } else {
      final response = await _productService.productUpdate(token, model,id);
      if(response!.code == 200){
        await ProductMessages.productUpdateSuccess();
        return response;
      }else {
        await ProductMessages.productUpdateFail();
      }
    }
  }
}
