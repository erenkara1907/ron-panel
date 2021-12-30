import 'package:ronventory_mobile/app/model/status/status_model.dart';
import 'package:ronventory_mobile/app/model/status/submodel/statu_response_model.dart';
import 'package:ronventory_mobile/app/model/status/submodel/status_request_model.dart';

abstract class StatusBase {
  Future<StatusModel?> statusList(String token);
  Future<StatusResponseModel?> statusCreate(String token, StatusRequestModel model);
  Future<StatusResponseModel?> statusUpdate(String token, StatusRequestModel model, int id );
}