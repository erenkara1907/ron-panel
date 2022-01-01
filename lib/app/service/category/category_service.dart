import 'package:get/get.dart';
import 'package:ronventory_mobile/app/core/service/category_base.dart';
import 'package:ronventory_mobile/app/model/category/category_model.dart';
import 'package:ronventory_mobile/app/model/category/submodel/category_create_request_model.dart';
import 'package:ronventory_mobile/app/model/category/submodel/category_response_model.dart';
import 'package:ronventory_mobile/app/model/category/submodel/category_update_request_model.dart';
import 'package:ronventory_mobile/app/util/consts.dart';

class CategoryService extends GetConnect with CategoryBase {
  @override
  Future<CategoryResponseModel?> categoryCreate(
      String token, CategoryCreateRequestModel model) async {
    final response = await post(categoryCreateUrl, model.toJson(),
        headers: {'x-token': token, 'x-device': 'mobile'});

    return CategoryResponseModel.fromJson(response.body);
  }

  @override
  Future<CategoryResponseModel?> categoryDelete(
      String token, CategoryCreateRequestModel model, int id) async {
    final response = await post('$categoryDeleteUrl/$id', model.toJson(),
        headers: {'x-token': token, 'x-device': 'mobile'});
    return CategoryResponseModel.fromJson(response.body);
  }

  @override
  Future<CategoryModel?> categoryInfo(String token, CategoryModel model) async {
    final response = await post(categoryInfoUrl, model.toJson(),
        headers: {'x-token': token, 'x-device': 'mobile'});
    return CategoryModel.fromJson(response.body);
  }

  @override
  Future<CategoryModel?> categoryList(
    String token,
  ) async {
    final response = await get(categoryListUrl,
        headers: {'x-token': token, 'x-device': 'mobile'});

    return CategoryModel.fromJson(response.body);
  }

  @override
  Future<CategoryModel?> categoryProduct(
      String token, CategoryModel model) async {
    final response = await post(categoryProductUrl, model.toJson(),
        headers: {'x-token': token, 'x-device': 'mobile'});
    return CategoryModel.fromJson(response.body);
  }

  @override
  Future<CategoryResponseModel?> categoryUpdate(
      String token, CategoryUpdateRequestModel model, int id) async {
    final response = await post("$categoryUpdateUrl/$id", model.toJson(),
        headers: {'x-token': token, 'x-device': 'mobile'});

    return CategoryResponseModel.fromJson(response.body);
  }
}
