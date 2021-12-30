import 'package:get/get.dart';
import 'package:ronventory_mobile/app/core/service/department_base.dart';
import 'package:ronventory_mobile/app/messages/department/department_messages.sncakbar.dart';
import 'package:ronventory_mobile/app/model/department/department_model.dart';
import 'package:ronventory_mobile/app/model/department/submodel/department_request_model.dart';
import 'package:ronventory_mobile/app/model/department/submodel/department_response_model.dart';
import 'package:ronventory_mobile/app/service/department/department_service.dart';

enum AppMode { DEBUG, RELEASE }

class DepartmentRepository implements DepartmentBase {
  final DepartmentService _departmentService = Get.put(DepartmentService());

  AppMode appMode = AppMode.RELEASE;

  @override
  Future<DepartmentResponseModel?> departmentCreate(
      String token, DepartmentRequestModel model) async {
    if (appMode == AppMode.DEBUG) {
      return null;
    } else {
      final response = await _departmentService.departmentCreate(token, model);
      if(response!.code == 200){
        await DepartmentMessages.departmentCreateSuccess();
        return response;
      }else {
        await DepartmentMessages.departmentCreateFail();
      }
    }
  }

  @override
  Future<DepartmentResponseModel?> departmentDelete(
      String token, DepartmentRequestModel model ,int id) async {
    if (appMode == AppMode.DEBUG) {
      return null;
    } else {
      final response = await _departmentService.departmentDelete(token, model,id);
      if(response!.code == 200){
        await DepartmentMessages.departmentDeleteSuccess();
        return response;
      }else {
        DepartmentMessages.departmentDeleteFail();
      }
    }
  }

  @override
  Future<DepartmentModel?> departmentInfo(
      String token, DepartmentModel model) async {
    if (appMode == AppMode.DEBUG) {
      return null;
    } else {
      return await _departmentService.departmentInfo(token, model);
    }
  }

  @override
  Future<DepartmentModel?> departmentList(String token) async {
    if (appMode == AppMode.DEBUG) {
      return null;
    } else {
      final response = await _departmentService.departmentList(token);
      if(response!.code == 200){
        return response;
      }
    }
  }

  @override
  Future<DepartmentResponseModel?> departmentUpdate(
      String token, DepartmentRequestModel model, int id) async {
    if (appMode == AppMode.DEBUG) {
      return null;
    } else {
      final response = await _departmentService.departmentUpdate(token, model, id);
      if(response!.code == 200){
        await DepartmentMessages.departmentUpdateSuccess();
        return response;
      }else {
        await DepartmentMessages.departmentUpdateFail();
      }
    }
  }
}
