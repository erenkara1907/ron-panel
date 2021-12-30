import 'package:get/get.dart';
import 'package:ronventory_mobile/app/core/service/status_base.dart';
import 'package:ronventory_mobile/app/core/service/status_group_base.dart';
import 'package:ronventory_mobile/app/messages/status/status_messages.snackbar.dart';
import 'package:ronventory_mobile/app/messages/status_group/status_group_messages.snackbar.dart';
import 'package:ronventory_mobile/app/model/status/status_model.dart';
import 'package:ronventory_mobile/app/model/status/submodel/statu_response_model.dart';
import 'package:ronventory_mobile/app/model/status/submodel/status_request_model.dart';
import 'package:ronventory_mobile/app/model/status_group/status_group_model.dart';
import 'package:ronventory_mobile/app/model/status_group/submodel/status_group_request_model.dart';
import 'package:ronventory_mobile/app/model/status_group/submodel/status_group_response_model.dart';
import 'package:ronventory_mobile/app/service/status/status_service.dart';
import 'package:ronventory_mobile/app/service/status_group/status_group_service.dart';

enum AppMode { DEBUG, RELEASE }

class StatusRepository implements StatusBase {
  final StatusService _statusService = Get.put(StatusService());
  AppMode appMode = AppMode.RELEASE;

  @override
  Future<StatusResponseModel?> statusCreate(
      String token, StatusRequestModel model) async {
    if(appMode == AppMode.DEBUG){
      return null;
    }else {
      final response = await _statusService.statusCreate(token, model);
      if(response!.code == 200){
        await StatusMessages.statusCreateSuccess();
        return response;
      }else {
        await StatusMessages.statusCreateFail();
        print("buradaaaaa");
      }
    }
  }

  @override
  Future<StatusModel?> statusList(String token) async {
    if(appMode == AppMode.DEBUG){
      return null;
    }else {
      final response = await _statusService.statusList(token);
      if(response!.code == 200){
        return response;
      }
    }
  }

  @override
  Future<StatusResponseModel?> statusUpdate(
      String token, StatusRequestModel model, int id) async {
    if(appMode == AppMode.DEBUG){
      return null;
    }else {
      final response = await _statusService.statusUpdate(token,model,id);

      if(response!.code == 200){
        await StatusMessages.statusUpdateSuccess();
        return response;

      }else {
        await StatusMessages.statusUpdateFail();
      }
    }

  }
}
