import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ronventory_mobile/app/controller/borrow/borrow_controller.dart';
import 'package:ronventory_mobile/app/core/auth_manager.dart';
import 'package:ronventory_mobile/app/core/network/network_controller.dart';
import 'package:ronventory_mobile/app/view/error/network_error/network_error_view.dart';
import 'package:ronventory_mobile/app/view/home/home_view.dart';
import 'package:ronventory_mobile/app/view/login/login_view.dart';

class OnBoard extends StatefulWidget {
  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  late AuthManager _authManager;
  final NetworkController _networkController = Get.find<NetworkController>();

  @override
  void initState() {
    super.initState();
    _authManager = Get.put(AuthManager());
    _authManager.bringToken();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _networkController.connectionStatus.value == 0
          ? NetworkErrorView()
          : _authManager.token != null
              ? HomeView()
              : LoginView(),
    );
  }
}
