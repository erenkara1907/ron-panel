import 'package:ronventory_mobile/app/model/status_group/status_group_model.dart';
import 'package:ronventory_mobile/app/model/status_group/submodel/status_group_request_model.dart';
import 'package:ronventory_mobile/app/model/status_group/submodel/status_group_response_model.dart';

abstract class StatusGroupBase {
  Future<StatusGroupModel?> statusGroupList(String token);
  Future<StatusGroupResponseModel?> statusGroupCreate(String token, StatusGroupRequestModel model);
  Future<StatusGroupResponseModel?> statusGroupUpdate(String token, StatusGroupRequestModel model, int id);
}