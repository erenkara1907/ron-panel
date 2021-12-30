import 'package:get/get.dart';
import 'package:ronventory_mobile/app/core/service/user_base.dart';
import 'package:ronventory_mobile/app/model/user/submodel/user_create_request_model.dart';
import 'package:ronventory_mobile/app/model/user/submodel/user_create_response_model.dart';
import 'package:ronventory_mobile/app/model/user/submodel/user_update_request_model.dart';
import 'package:ronventory_mobile/app/model/user/submodel/user_update_response_model.dart';
import 'package:ronventory_mobile/app/model/user/user_model.dart';
import 'package:ronventory_mobile/app/util/consts.dart';

class UserService extends GetConnect with UserBase {
  @override
  Future<UserCreateResponseModel?> userCreate(
      String token, UserCreateRequestModel model) async {
    final response = await post(userCreateUrl, model.toJson(), headers: {
      'x-token': token,
      'x-device': 'mobile'
    });

    return UserCreateResponseModel.fromJson(response.body);
  }

  @override
  Future<UserModel?> userInfo(String token, UserModel model) async {
    final response = await post(userInfoUrl, model.toJson(), headers: {
      'x-token': token,
      'x-device': 'mobile'
    });
    return UserModel.fromJson(response.body);
  }

  @override
  Future<UserModel?> userList(String token) async {
    final response = await get(userListUrl, headers: {
      'x-token': token,
      'x-device': 'mobile'
    });

    return UserModel.fromJson(response.body);
  }

  @override
  Future<UserModel?> userProduct(String token, UserModel model) async {
    final response = await post(userProductUrl, model.toJson(), headers: {
      'x-token': token,
      'x-device': 'mobile'
    });
    return UserModel.fromJson(response.body);
  }

  @override
  Future<UserModel?> userRemove(String token, UserModel model) async {
    final response = await post(userDeleteUrl, model.toJson(), headers: {
      'x-token': token,
      'x-device': 'mobile'
    });
    return UserModel.fromJson(response.body);
  }

  @override
  Future<UserUpdateResponseModel?> userUpdate(String token, UserUpdateRequestModel model, int id) async {
    final response = await post("$userUpdateUrl/$id", model.toJson(), headers: {
      'x-token': token,
      'x-device': 'mobile'
    });
    print("buraaa : ${response.body}");
    return UserUpdateResponseModel.fromJson(response.body);
  }
}
