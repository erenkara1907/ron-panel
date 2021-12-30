import 'package:get/get.dart';
import 'package:ronventory_mobile/app/core/service/permission_base.dart';
import 'package:ronventory_mobile/app/messages/permission/permission_messages.snackbar.dart';
import 'package:ronventory_mobile/app/model/permission/permission_model.dart';
import 'package:ronventory_mobile/app/service/permission/permission_service.dart';
import 'package:ronventory_mobile/app/view/login/login_view.dart';

enum AppMode { DEBUG, RELEASE }

class PermissionRepository implements PermissionBase {
  final PermissionService _permissionService = Get.put(PermissionService());
  AppMode appMode = AppMode.RELEASE;

  @override
  Future<PermissionModel?> permissionCreate(
      String token, ConclusionPermission model) async {
    if (appMode == AppMode.DEBUG) {
      return null;
    } else {
      final response = await _permissionService.permissionCreate(token, model);
      if (response!.code == 200) {
        await PermissionMessages.permissionCreateSuccess();
        return response;
      } else {
        await PermissionMessages.permissionCreateFail();
      }
    }
  }

  @override
  Future<PermissionModel?> permissionList(String token) async {
    if (appMode == AppMode.DEBUG) {
      return null;
    } else {
      final response = await _permissionService.permissionList(token);
      if (response!.code == 200) {
        return response;
      }
    }
  }
}
