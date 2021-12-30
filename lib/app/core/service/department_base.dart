
import 'package:ronventory_mobile/app/model/department/department_model.dart';
import 'package:ronventory_mobile/app/model/department/submodel/department_request_model.dart';
import 'package:ronventory_mobile/app/model/department/submodel/department_response_model.dart';

abstract class DepartmentBase{
  Future<DepartmentModel?> departmentList(String token);
  Future<DepartmentResponseModel?> departmentCreate(String token , DepartmentRequestModel model);
  Future<DepartmentResponseModel?> departmentUpdate(String token , DepartmentRequestModel model, int id);
  Future<DepartmentResponseModel?> departmentDelete(String token , DepartmentRequestModel model, int id);
  Future<DepartmentModel?> departmentInfo(String token , DepartmentModel model);
}