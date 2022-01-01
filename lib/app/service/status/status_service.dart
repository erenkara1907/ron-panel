import 'package:get/get.dart';
import 'package:ronventory_mobile/app/core/service/status_base.dart';
import 'package:ronventory_mobile/app/model/status/status_model.dart';
import 'package:ronventory_mobile/app/model/status/submodel/statu_response_model.dart';
import 'package:ronventory_mobile/app/model/status/submodel/status_request_model.dart';
import 'package:ronventory_mobile/app/util/consts.dart';

class StatusService extends GetConnect with StatusBase {
  @override
  Future<StatusResponseModel?> statusCreate(
      String token, StatusRequestModel model) async {
    final response = await post(statusCreateUrl, model.toJson(), headers: {
      'x-token': token,
      'x-device': 'mobile'
    });
    print(response.body);
    return StatusResponseModel.fromJson(response.body);
  }

  @override
  Future<StatusModel?> statusList(String token) async {
    final response = await get(statusListUrl, headers: {
      'x-token': token,
      'x-device': 'mobile'
    });

    return StatusModel.fromJson(response.body);
  }

  @override
  Future<StatusResponseModel?> statusUpdate(
      String token, StatusRequestModel model, int id) async {
    final response =
    await post('$statusUpdateUrl/$id', model.toJson(), headers: {
      'x-token': token,
      'x-device': 'mobile'
    });
    print("${response.body}");
    return StatusResponseModel.fromJson(response.body);
  }
}