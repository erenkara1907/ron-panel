import 'package:get/get.dart';
import 'package:ronventory_mobile/app/core/service/product_base.dart';
import 'package:ronventory_mobile/app/model/product/product_model.dart';
import 'package:ronventory_mobile/app/model/product/submodel/product_create_request_model.dart';
import 'package:ronventory_mobile/app/model/product/submodel/product_response_model.dart';
import 'package:ronventory_mobile/app/model/product/submodel/product_update_request_model.dart';
import 'package:ronventory_mobile/app/util/consts.dart';

class ProductService extends GetConnect with ProductBase {
  @override
  Future<ProductResponseModel?> productCreate(
      String token, ProductCreateRequestModel model) async {
    final response = await post(productCreateUrl, model.toJson(), headers: {
      'x-token': token,
      'x-device': 'mobile'
    });
    return ProductResponseModel.fromJson(response.body);
  }

  @override
  Future<ProductResponseModel?> productDelete(String token, ProductCreateRequestModel model, int id) async {
    final response = await post('$productDeleteUrl/$id', model.toJson(), headers: {
      'x-token': token,
      'x-device': 'mobile'
    });
    return ProductResponseModel.fromJson(response.body);
  }

  @override
  Future<ProductModel?> productInfo(String token, ProductModel model) async {
    final response = await post(productInfoUrl, model.toJson(), headers: {
      'x-token': token,
      'x-device': 'mobile'
    });
    return ProductModel.fromJson(response.body);
  }

  @override
  Future<ProductModel?> productList(String token) async {
    final response = await get(productListUrl, headers: {
      'x-token': token,
      'x-device': 'mobile'
    });
    return ProductModel.fromJson(response.body);
  }

  @override
  Future<ProductResponseModel?> productUpdate(String token, ProductUpdateRequestModel model, int id) async {
    final response = await post('$productUpdateUrl/$id', model.toJson(), headers: {
      'x-token': token,
      'x-device': 'mobile'
    });
    return ProductResponseModel.fromJson(response.body);
  }
}
