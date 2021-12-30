import 'package:get/get.dart';
import 'package:ronventory_mobile/app/app_binding.dart';
import 'package:ronventory_mobile/app/view/borrow/borrow_view.dart';
import 'package:ronventory_mobile/app/view/category/category_view.dart';
import 'package:ronventory_mobile/app/view/department/department_view.dart';
import 'package:ronventory_mobile/app/view/home/home_view.dart';
import 'package:ronventory_mobile/app/view/login/login_view.dart';
import 'package:ronventory_mobile/app/view/onboard/onboard_view.dart';
import 'package:ronventory_mobile/app/view/permission/permission_view.dart';
import 'package:ronventory_mobile/app/view/product/product_view.dart';
import 'package:ronventory_mobile/app/view/splash/splash_view.dart';
import 'package:ronventory_mobile/app/view/status/status_view.dart';
import 'package:ronventory_mobile/app/view/status_group/status_group_view.dart';
import 'package:ronventory_mobile/app/view/user/user_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: AppBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARD,
      page: () => OnBoard(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: AppBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: AppBinding(),
    ),
    GetPage(
      name: _Paths.DEPARTMENT,
      page: () => DepartmentView(),
      binding: AppBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => ProductView(),
      binding: AppBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY,
      page: () => CategoryView(),
      binding: AppBinding(),
    ),
    GetPage(
      name: _Paths.BORROW,
      page: () => BorrowView(),
      binding: AppBinding(),
    ),
    GetPage(
      name: _Paths.PERMISSION,
      page: () => PermissionView(),
      binding: AppBinding(),
    ),
    GetPage(
      name: _Paths.USER,
      page: () => UserView(),
      binding: AppBinding(),
    ),
    GetPage(name: _Paths.STATUSGROUP, page: () => StatusGroupView(),binding: AppBinding(),),
    GetPage(name: _Paths.STATUS, page: () => StatusView(), binding: AppBinding(),),
  ];
}
