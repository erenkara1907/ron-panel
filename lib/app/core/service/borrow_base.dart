import 'package:ronventory_mobile/app/model/borrow/borrow_model.dart';
import 'package:ronventory_mobile/app/model/borrow/submodel/borrow_request_model.dart';
import 'package:ronventory_mobile/app/model/borrow/submodel/borrow_response_model.dart';

abstract class BorrowBase {
  Future<BorrowModel?> borrowList(String token);

  Future<BorrowResponseModel?> borrowCreate(String token, BorrowRequestModel model);
}
