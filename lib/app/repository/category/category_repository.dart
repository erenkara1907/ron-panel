import 'package:get/get.dart';
import 'package:ronventory_mobile/app/core/service/category_base.dart';
import 'package:ronventory_mobile/app/messages/category/category_messages.snackbar.dart';
import 'package:ronventory_mobile/app/model/category/category_model.dart';
import 'package:ronventory_mobile/app/model/category/submodel/category_create_request_model.dart';
import 'package:ronventory_mobile/app/model/category/submodel/category_response_model.dart';
import 'package:ronventory_mobile/app/model/category/submodel/category_update_request_model.dart';
import 'package:ronventory_mobile/app/service/category/category_service.dart';
import 'package:ronventory_mobile/app/view/login/login_view.dart';

enum AppMode { DEBUG, RELEASE }

class CategoryRepository implements CategoryBase {
  final CategoryService _categoryService = Get.put(CategoryService());

  AppMode appMode = AppMode.RELEASE;

  @override
  Future<CategoryResponseModel?> categoryCreate(
      String token, CategoryCreateRequestModel model) async {
    if (appMode == AppMode.DEBUG) {
      return null;
    } else {
      final response = await _categoryService.categoryCreate(token, model);
      if (response!.code == 200) {
        await CategoryMessages.categoryCreateSuccess();
        return response;
      } else {
        await CategoryMessages.categoryCreateFail();
      }
    }
  }

  @override
  Future<CategoryResponseModel?> categoryDelete(
      String token, CategoryCreateRequestModel model, int id) async {
    if (appMode == AppMode.DEBUG) {
      return null;
    } else {
      final response = await _categoryService.categoryDelete(token, model, id);
      if (response!.code == 200) {
        await CategoryMessages.categoryDeleteSuccess();
        return response;
      } else {
        await CategoryMessages.categoryDeleteFail();
      }
    }
  }

  @override
  Future<CategoryModel?> categoryInfo(String token, CategoryModel model) async {
    if (appMode == AppMode.DEBUG) {
      return null;
    } else {
      return await _categoryService.categoryInfo(token, model);
    }
  }

  @override
  Future<CategoryModel?> categoryList(String token) async {
    if (appMode == AppMode.DEBUG) {
      return null;
    } else {
      final response = await _categoryService.categoryList(token);
      if (response!.code == 200) {
        return response;
      }
    }
  }

  @override
  Future<CategoryModel?> categoryProduct(
      String token, CategoryModel model) async {
    if (appMode == AppMode.DEBUG) {
      return null;
    } else {
      return await _categoryService.categoryProduct(token, model);
    }
  }

  @override
  Future<CategoryResponseModel?> categoryUpdate(
      String token, CategoryUpdateRequestModel model, int id) async {
    if (appMode == AppMode.DEBUG) {
      return null;
    } else {
      final response = await _categoryService.categoryUpdate(token, model, id);
      if (response!.code == 200) {
        await CategoryMessages.categoryUpdateSuccess();
        return response;
      } else {
        await CategoryMessages.categoryUpdateFail();
      }
    }
  }
}
