import 'package:ronventory_mobile/app/model/permission/permission_model.dart';

abstract class PermissionBase {
  Future<PermissionModel?> permissionList(String token);
  Future<PermissionModel?> permissionCreate(String token, ConclusionPermission model);
}