import 'package:get/get.dart';
import 'package:ronventory_mobile/app/controller/auth/auth_controller.dart';
import 'package:ronventory_mobile/app/controller/borrow/borrow_controller.dart';
import 'package:ronventory_mobile/app/controller/department/department_controller.dart';
import 'package:ronventory_mobile/app/controller/home/home_controller.dart';
import 'package:ronventory_mobile/app/controller/permission/permission_controller.dart';
import 'package:ronventory_mobile/app/controller/product/product_controller.dart';
import 'package:ronventory_mobile/app/controller/splash/splash_controller.dart';
import 'package:ronventory_mobile/app/controller/status/status_controller.dart';
import 'package:ronventory_mobile/app/controller/status_group/status_group_controller.dart';
import 'package:ronventory_mobile/app/controller/user/user_controller.dart';
import 'package:ronventory_mobile/app/core/auth_manager.dart';
import 'package:ronventory_mobile/app/core/network/network_controller.dart';

import 'controller/category/category_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<AuthManager>(() => AuthManager());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<DepartmentController>(() => DepartmentController());
    Get.lazyPut<CategoryController>(() => CategoryController());
    Get.lazyPut<ProductController>(() => ProductController());
    Get.lazyPut<BorrowController>(() => BorrowController());
    Get.lazyPut<PermissionController>(() => PermissionController());
    Get.lazyPut<UserController>(() => UserController());
    Get.lazyPut<NetworkController>(() => NetworkController());
    Get.lazyPut<StatusGroupController>(() => StatusGroupController());
    Get.lazyPut<StatusController>(() =>StatusController());
  }
}
