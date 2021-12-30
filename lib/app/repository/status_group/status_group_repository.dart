import 'package:get/get.dart';
import 'package:ronventory_mobile/app/core/service/status_group_base.dart';
import 'package:ronventory_mobile/app/messages/status_group/status_group_messages.snackbar.dart';
import 'package:ronventory_mobile/app/model/status_group/status_group_model.dart';
import 'package:ronventory_mobile/app/model/status_group/submodel/status_group_request_model.dart';
import 'package:ronventory_mobile/app/model/status_group/submodel/status_group_response_model.dart';
import 'package:ronventory_mobile/app/service/status_group/status_group_service.dart';

enum AppMode { DEBUG, RELEASE }

class StatusGroupRepository implements StatusGroupBase {
  final StatusGroupService _statusGroupService = Get.put(StatusGroupService());
  AppMode appMode = AppMode.RELEASE;

  @override
  Future<StatusGroupResponseModel?> statusGroupCreate(
      String token, StatusGroupRequestModel model) async {
    if(appMode == AppMode.DEBUG){
      return null;
    }else {
      final response = await _statusGroupService.statusGroupCreate(token, model);
      if(response!.code == 200){
        await StatusGroupMessages.statusGroupCreateSuccess();
        return response;
      }else {
        await StatusGroupMessages.statusGroupCreateFail();
      }
    }
  }

  @override
  Future<StatusGroupModel?> statusGroupList(String token) async {
    if(appMode == AppMode.DEBUG){
      return null;
    }else {
      final response = await _statusGroupService.statusGroupList(token);
      if(response!.code == 200){
        return response;
      }
    }
  }

  @override
  Future<StatusGroupResponseModel?> statusGroupUpdate(
      String token, StatusGroupRequestModel model, int id) async {
    if(appMode == AppMode.DEBUG){
      return null;
    }else {
      final response = await _statusGroupService.statusGroupUpdate(token,model,id);
      if(response!.code == 200){
        await StatusGroupMessages.statusGroupUpdateSuccess();
        return response;
      }else {
        await StatusGroupMessages.statusGroupUpdateFail();
      }
    }
  }
}
