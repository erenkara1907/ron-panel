import 'package:get/get.dart';
import 'package:ronventory_mobile/app/core/service/borrow_base.dart';
import 'package:ronventory_mobile/app/messages/borrow/borrow_messages.snackbar.dart';
import 'package:ronventory_mobile/app/model/borrow/borrow_model.dart';
import 'package:ronventory_mobile/app/model/borrow/submodel/borrow_request_model.dart';
import 'package:ronventory_mobile/app/model/borrow/submodel/borrow_response_model.dart';
import 'package:ronventory_mobile/app/service/borrow/borrow_service.dart';
import 'package:ronventory_mobile/app/view/login/login_view.dart';

enum AppMode { DEBUG, RELEASE }

class BorrowRepository implements BorrowBase {
  final BorrowService _borrowService = Get.put(BorrowService());

  AppMode appMode = AppMode.RELEASE;

  @override
  Future<BorrowResponseModel?> borrowCreate(
      String token, BorrowRequestModel model) async {
    if (appMode == AppMode.DEBUG) {
      return null;
    } else {
      final response = await _borrowService.borrowCreate(token, model);
      if (response!.code == 200) {
        await BorrowMessages.borrowCreateSuccess();
        return response;
      } else {
        await BorrowMessages.borrowCreateFail();
      }
    }
  }

  @override
  Future<BorrowModel?> borrowList(String token) async {
    if(appMode == AppMode.DEBUG){
      return null;
    }else {
      final response = await _borrowService.borrowList(token);
      if(response!.code == 200){
        return response;
      }
    }
  }
}
