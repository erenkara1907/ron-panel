import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ronventory_mobile/app/controller/permission/permission_controller.dart';
import 'package:ronventory_mobile/app/core/common_widgets/card_widget.dart';
import 'package:ronventory_mobile/app/core/common_widgets/sidebar.dart';
import 'package:ronventory_mobile/app/core/common_widgets/try_again.widget.dart';
import 'package:ronventory_mobile/app/general/color/app_colors.dart';
import 'package:ronventory_mobile/app/general/text/app_text.style.dart';
import 'package:skeletons/skeletons.dart';

class PermissionView extends GetView<PermissionController> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        drawer: SideBar(),
        appBar: AppBar(
          title: Text(
            "Yetkiler",
            style: AppTextStyle().kTextStyleFourteenWithThemeColor,
          ),
          backgroundColor: AppColors().kAppBarBackground,
        ),
        body: Obx(
          () => Skeleton(
            isLoading: controller.dataProcessing.value,
            skeleton: SkeletonListView(),
            child: controller.permissionModel != null
                ? controller.dataProcessing.value == false
                ? ListView.builder(
                itemCount: controller.permissionListTask.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardWidget(
                    title:
                    '${controller.permissionListTask[index].title}',
                    borderColor: Colors.white,
                    shadowColor: Colors.white,
                    children: [
                      Text(
                        '${controller.permissionListTask[index].name}',
                        style: AppTextStyle().kTextStyleEmail,
                      ),
                    ],
                  );
                })
                : const SizedBox()
                : TryAgainWidget(
              onPressed: () async {
                await controller.permissionList();
              },
            ),
          ),
        ),
      ),
    );
  }
}
