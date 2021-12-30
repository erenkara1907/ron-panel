import 'package:get/get.dart';
import 'package:ronventory_mobile/app/core/service/status_group_base.dart';
import 'package:ronventory_mobile/app/model/status_group/status_group_model.dart';
import 'package:ronventory_mobile/app/model/status_group/submodel/status_group_request_model.dart';
import 'package:ronventory_mobile/app/model/status_group/submodel/status_group_response_model.dart';
import 'package:ronventory_mobile/app/util/consts.dart';

class StatusGroupService extends GetConnect with StatusGroupBase {
  @override
  Future<StatusGroupResponseModel?> statusGroupCreate(
      String token, StatusGroupRequestModel model) async {
    final response = await post(statusGroupCreateUrl, model.toJson(), headers: {
      'x-token': token,
      'x-device': 'mobile'
    });
    return StatusGroupResponseModel.fromJson(response.body);
  }

  @override
  Future<StatusGroupModel?> statusGroupList(String token) async {
    final response = await get(statusGroupListUrl, headers: {
      'x-token': token,
      'x-device': 'mobile'
    });

    return StatusGroupModel.fromJson(response.body);
  }

  @override
  Future<StatusGroupResponseModel?> statusGroupUpdate(
      String token, StatusGroupRequestModel model, int id) async {
    final response =
        await post('$statusGroupUpdateUrl/$id', model.toJson(), headers: {
      'x-token': token,
          'x-device': 'mobile'
    });

    return StatusGroupResponseModel.fromJson(response.body);
  }
}
