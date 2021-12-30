import 'package:ronventory_mobile/app/model/category/category_model.dart';
import 'package:ronventory_mobile/app/model/category/submodel/category_create_request_model.dart';
import 'package:ronventory_mobile/app/model/category/submodel/category_response_model.dart';
import 'package:ronventory_mobile/app/model/category/submodel/category_update_request_model.dart';

abstract class CategoryBase {
  Future<CategoryModel?> categoryList(String token,);

  Future<CategoryResponseModel?> categoryCreate(String token, CategoryCreateRequestModel model);

  Future<CategoryResponseModel?> categoryUpdate(String token, CategoryUpdateRequestModel model, int id);

  Future<CategoryResponseModel?> categoryDelete(String token, CategoryCreateRequestModel model, int id);

  Future<CategoryModel?> categoryInfo(String token, CategoryModel model);

  Future<CategoryModel?> categoryProduct(String token, CategoryModel model);
}
