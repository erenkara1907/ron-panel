part of 'app_pages.dart';

abstract class Routes {
  static const SPLASH = _Paths.SPLASH;
  static const ONBOARD = _Paths.ONBOARD;
  static const LOGIN = _Paths.LOGIN;
  static const HOME = _Paths.HOME;
  static const DEPARTMENT = _Paths.DEPARTMENT;
  static const CATEGORY = _Paths.CATEGORY;
  static const SELLPRODUCT = _Paths.BORROW;
  static const PRODUCT = _Paths.PRODUCT;
  static const PERMISSION = _Paths.PERMISSION;
  static const SETTINGS = _Paths.SETTNGS;
  static const USER = _Paths.USER;
  static const STATUSGROUP = _Paths.STATUSGROUP;
  static const STATUS = _Paths.STATUS;
}

abstract class _Paths {
  static const SPLASH = '/splash';
  static const ONBOARD = '/onboard';
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const DEPARTMENT = '/department';
  static const CATEGORY = '/category';
  static const BORROW = '/borrow';
  static const PRODUCT = '/product';
  static const PERMISSION = '/permission';
  static const SETTNGS = '/settings';
  static const USER = '/user';
  static const STATUSGROUP = '/status-group';
  static const STATUS = '/status';
}