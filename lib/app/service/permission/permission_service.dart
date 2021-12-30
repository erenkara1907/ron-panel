import 'package:get/get.dart';
import 'package:ronventory_mobile/app/core/service/permission_base.dart';
import 'package:ronventory_mobile/app/model/permission/permission_model.dart';
import 'package:ronventory_mobile/app/util/consts.dart';

class PermissionService extends GetConnect with PermissionBase {
  @override
  Future<PermissionModel?> permissionCreate(
      String token, ConclusionPermission model) async {
    final response = await post(permissionCreateUrl, model.toJson(), headers: {
      'x-token': token,
      'x-device': 'mobile'
    });

    return PermissionModel.fromJson(response.body);
  }

  @override
  Future<PermissionModel?> permissionList(String token) async {
    final response = await get(permissionListUrl, headers: {
      'x-token': token,
      'x-device': 'mobile'
    });

    return PermissionModel.fromJson(response.body);
  }
}
