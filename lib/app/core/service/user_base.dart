import 'package:ronventory_mobile/app/model/user/submodel/user_create_request_model.dart';
import 'package:ronventory_mobile/app/model/user/submodel/user_create_response_model.dart';
import 'package:ronventory_mobile/app/model/user/submodel/user_update_request_model.dart';
import 'package:ronventory_mobile/app/model/user/submodel/user_update_response_model.dart';
import 'package:ronventory_mobile/app/model/user/user_model.dart';

abstract class UserBase {
  Future<UserModel?> userList(String token);

  Future<UserCreateResponseModel?> userCreate(
      String token, UserCreateRequestModel model);

  Future<UserModel?> userRemove(String token, UserModel model);

  Future<UserUpdateResponseModel?> userUpdate(String token, UserUpdateRequestModel model,int id);

  Future<UserModel?> userInfo(String token, UserModel model);

  Future<UserModel?> userProduct(String token, UserModel model);
}
