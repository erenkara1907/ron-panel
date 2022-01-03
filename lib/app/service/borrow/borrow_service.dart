import 'package:get/get.dart';
import 'package:ronventory_mobile/app/core/service/borrow_base.dart';
import 'package:ronventory_mobile/app/model/borrow/borrow_model.dart';
import 'package:ronventory_mobile/app/model/borrow/submodel/borrow_request_model.dart';
import 'package:ronventory_mobile/app/model/borrow/submodel/borrow_response_model.dart';
import 'package:ronventory_mobile/app/util/consts.dart';

class BorrowService extends GetConnect with BorrowBase {
  @override
  Future<BorrowResponseModel?> borrowCreate(
      String token, BorrowRequestModel model) async {
    final response = await post(borrowCreateUrl, model.toJson(),
        headers: {'x-token': token, 'x-device': 'mobile'});

    return BorrowResponseModel.fromJson(response.body);
  }

  @override
  Future<BorrowModel?> borrowList(String token) async {
    final response = await get(borrowListUrl,
        headers: {'x-token': token, 'x-device': 'mobile'});

    return BorrowModel.fromJson(response.body);
  }
}
