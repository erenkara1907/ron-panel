
import 'package:ronventory_mobile/app/model/product/product_model.dart';
import 'package:ronventory_mobile/app/model/product/submodel/product_create_request_model.dart';
import 'package:ronventory_mobile/app/model/product/submodel/product_response_model.dart';
import 'package:ronventory_mobile/app/model/product/submodel/product_update_request_model.dart';

abstract class ProductBase{
  Future<ProductModel?> productList(String token );
  Future<ProductResponseModel?> productCreate(String token , ProductCreateRequestModel model);
  Future<ProductResponseModel?> productUpdate(String token , ProductUpdateRequestModel model, int id);
  Future<ProductResponseModel?> productDelete(String token , ProductCreateRequestModel model, int id);
  Future<ProductModel?> productInfo(String token , ProductModel model);
}