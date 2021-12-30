import 'package:get/get.dart';
import 'package:ronventory_mobile/app/controller/borrow/borrow_controller.dart';
import 'package:ronventory_mobile/app/core/network/network_controller.dart';

class NetworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkController>(
      () => NetworkController(),
    );
    Get.lazyPut<BorrowController>(() => BorrowController());
  }
}
