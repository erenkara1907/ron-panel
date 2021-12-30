import 'package:get/get.dart';
import 'package:ronventory_mobile/app/core/service/user_base.dart';
import 'package:ronventory_mobile/app/messages/user/user_messages.snackbar.dart';
import 'package:ronventory_mobile/app/model/user/submodel/user_create_request_model.dart';
import 'package:ronventory_mobile/app/model/user/submodel/user_create_response_model.dart';
import 'package:ronventory_mobile/app/model/user/submodel/user_update_request_model.dart';
import 'package:ronventory_mobile/app/model/user/submodel/user_update_response_model.dart';
import 'package:ronventory_mobile/app/model/user/user_model.dart';
import 'package:ronventory_mobile/app/service/user/user_service.dart';

enum AppMode { DEBUG, RELEASE }

class UserRepository implements UserBase {
  final UserService _userService = Get.put(UserService());

  AppMode appMode = AppMode.RELEASE;

  @override
  Future<UserCreateResponseModel?> userCreate(String token, UserCreateRequestModel model) async {
    if (appMode == AppMode.DEBUG) {
      return null;
    } else {
      final response = await _userService.userCreate(token, model);
      if(response!.code == 200){

        return response;
      }

    }
  }

  @override
  Future<UserModel?> userInfo(String token, UserModel model) async {
    if (appMode == AppMode.DEBUG) {
      return null;
    } else {
      return await _userService.userInfo(token, model);
    }
  }

  @override
  Future<UserModel?> userList(String token) async {
    if (appMode == AppMode.DEBUG) {
      return null;
    } else {
      final response = await _userService.userList(token);
      if (response!.code == 200) {
        return response;
      }
    }
  }

  @override
  Future<UserModel?> userProduct(String token, UserModel model) async {
    if (appMode == AppMode.DEBUG) {
      return null;
    } else {
      return await _userService.userProduct(token, model);
    }
  }

  @override
  Future<UserModel?> userRemove(String token, UserModel model) async {
    if (appMode == AppMode.DEBUG) {
      return null;
    } else {
      final response = await _userService.userRemove(token, model);
      if(response!.code == 200){
        await UserMessages.userDeleteSuccess();
        return response;
      }else {
        await UserMessages.userDeleteFail();
      }
    }
  }

  @override
  Future<UserUpdateResponseModel?> userUpdate(String token, UserUpdateRequestModel model,int id) async {
    if (appMode == AppMode.DEBUG) {
      return null;
    } else {
      final response = await _userService.userUpdate(token, model,id);
      if(response!.code == 200){

        return response;
      }
    }
  }
}
