import 'package:get/get.dart';
import 'package:ronventory_mobile/app/core/service/department_base.dart';
import 'package:ronventory_mobile/app/model/department/department_model.dart';
import 'package:ronventory_mobile/app/model/department/submodel/department_request_model.dart';
import 'package:ronventory_mobile/app/model/department/submodel/department_response_model.dart';
import 'package:ronventory_mobile/app/util/consts.dart';

class DepartmentService extends GetConnect with DepartmentBase {
  @override
  Future<DepartmentResponseModel?> departmentCreate(
      String token, DepartmentRequestModel model) async {
    final response = await post(departmentCreateUrl, model.toJson(), headers: {
      'x-token': token,
      'x-device': 'mobile'
    });

    return DepartmentResponseModel.fromJson(response.body);
  }

  @override
  Future<DepartmentResponseModel?> departmentDelete(
      String token, DepartmentRequestModel model, int id) async {
    final response =
        await post('$departmentDeleteUrl/$id', model.toJson(), headers: {
      'x-token': token,
          'x-device': 'mobile'
    });
    return DepartmentResponseModel.fromJson(response.body);
  }

  @override
  Future<DepartmentModel?> departmentInfo(
      String token, DepartmentModel model) async {
    final response = await post(departmentInfoUrl, model.toJson(), headers: {
      'x-token': token,
      'x-device': 'mobile'
    });
    return DepartmentModel.fromJson(response.body);
  }

  @override
  Future<DepartmentModel?> departmentList(String token) async {
    final response = await get(departmentListUrl, headers: {
      'x-token': token,
      'x-device': 'mobile'
    });
    return DepartmentModel.fromJson(response.body);
  }

  @override
  Future<DepartmentResponseModel?> departmentUpdate(
      String token, DepartmentRequestModel model, int id) async {
    final response =
        await post('$departmentUpdateUrl/$id', model.toJson(), headers: {
      'x-token': token,
          'x-device': 'mobile'
    });

    return DepartmentResponseModel.fromJson(response.body);
  }
}
