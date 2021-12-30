import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ronventory_mobile/app/core/auth_manager.dart';
import 'package:ronventory_mobile/app/model/permission/permission_model.dart';
import 'package:ronventory_mobile/app/repository/permission/permission_repository.dart';

class PermissionController extends GetxController {
  late final AuthManager _authManager;
  late final PermissionRepository _permissionRepository;

  var dataProcessing = false.obs;

  PermissionModel? permissionModel;

  var permissionListTask = <ConclusionPermission>[].obs;

  late TextEditingController permissionNameController;

  @override
  void onInit() {
    super.onInit();
    _authManager = Get.put(AuthManager());
    _permissionRepository = Get.put(PermissionRepository());
    permissionNameController = TextEditingController();
  }

  Future<PermissionModel?> permissionList() async {
    dataProcessing.value = true;
    _authManager.bringToken();
    final token = _authManager.token;
    permissionModel = await _permissionRepository.permissionList(token!);
    permissionListTask.assignAll(permissionModel!.result!.conclusion!);
    dataProcessing.value = false;
    final newToken = permissionModel!.result!.token!;
    await _authManager.enterToken(newToken);
  }

  Future<PermissionModel?> permissionCreate(String title, String name) async {
    _authManager.bringToken();
    final token = _authManager.token;
    permissionModel = await _permissionRepository.permissionCreate(token!, ConclusionPermission(title: title,name: name));
    final newToken = permissionModel!.result!.token;
    _authManager.enterToken(newToken);
  }
}