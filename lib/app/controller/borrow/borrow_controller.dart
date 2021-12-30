import 'package:get/get.dart';
import 'package:ronventory_mobile/app/controller/settings/settings_controller.dart';
import 'package:ronventory_mobile/app/core/auth_manager.dart';
import 'package:ronventory_mobile/app/core/common_widgets/sidebar.dart';
import 'package:ronventory_mobile/app/model/borrow/borrow_model.dart';
import 'package:ronventory_mobile/app/model/borrow/submodel/borrow_request_model.dart';
import 'package:ronventory_mobile/app/model/borrow/submodel/borrow_response_model.dart';
import 'package:ronventory_mobile/app/repository/borrow/borrow_repository.dart';

class BorrowController extends GetxController {
  late final AuthManager _authManager;
  late final BorrowRepository _borrowRepository;
  late final SettingsController _settingsController;

  var dataProcessing = false.obs;

  BorrowModel? borrowModel;
  BorrowResponseModel? borrowResponseModel;

  var borrowListTask = <ConclusionBorrow>[].obs;

  @override
  void onInit() async {
    super.onInit();
    _authManager = Get.put(AuthManager());
    _settingsController = Get.put(SettingsController());
    _borrowRepository = Get.put(BorrowRepository());
  }

  Future<BorrowModel?> borrowList() async {
    dataProcessing.value = true;
    await _authManager.bringToken();
    final token = _authManager.token;
    borrowModel = await _borrowRepository.borrowList(token!);
    borrowListTask.assignAll(borrowModel!.result!.conclusion!);
    dataProcessing.value = false;
    final newToken = borrowModel!.result!.token!;
    await _authManager.enterToken(newToken);
  }

  Future<BorrowModel?> borrowCreate(int userId, int productId,
      String description, String startDate, dynamic endDate) async {
    _authManager.bringToken();
    final token = _authManager.token;
    if (endDate == null) {
      return null;
    }
    borrowResponseModel = await _borrowRepository.borrowCreate(
      token!,
      BorrowRequestModel(
        userId: userId,
        productId: productId,
        description: description,
        startDate: startDate,
        endDate: endDate,
      ),
    );
    final newToken = borrowResponseModel!.result!.token;
    _authManager.enterToken(newToken);
  }
}
