import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ronventory_mobile/app/controller/status_group/status_group_controller.dart';
import 'package:ronventory_mobile/app/core/common_widgets/card_widget.dart';
import 'package:ronventory_mobile/app/core/common_widgets/sidebar.dart';
import 'package:ronventory_mobile/app/core/common_widgets/try_again.widget.dart';
import 'package:ronventory_mobile/app/general/color/app_colors.dart';
import 'package:ronventory_mobile/app/general/text/app_text.style.dart';
import 'package:ronventory_mobile/app/messages/category/category_messages.snackbar.dart';
import 'package:ronventory_mobile/app/view/user/user_view.dart';
import 'package:skeletons/skeletons.dart';

class StatusGroupView extends GetView<StatusGroupController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        drawer: SideBar(),
        appBar: AppBar(
          title: Text(
            "Statü Grupları",
            style: AppTextStyle().kTextStyleFourteenWithThemeColor,
          ),
          backgroundColor: AppColors().kAppBarBackground,
        ),
        body: Obx(
          () => Skeleton(
            isLoading: controller.dataProcessing.value,
            skeleton: SkeletonListView(),
            child: controller.statusGroupModel != null
                ? controller.dataProcessing.value == false
                ? ListView.builder(
                itemCount: controller.statusGroupListTask.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardWidget(
                    title: controller.statusGroupListTask[index].title!,
                    borderColor: Colors.white,
                    shadowColor: Colors.white,
                    children: [
                      Expanded(
                        child: Text(
                          controller.statusGroupListTask[index].options!,
                          style: AppTextStyle().kTextStyleEmail,
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                            onPressed: () {
                              controller
                                  .statusGroupUpdateMethod(context, index)
                                  .show();
                            },
                            child: const Text(
                              'Güncelle',
                              style: TextStyle(color: Colors.green),
                            )),
                      ),
                    ],
                  );
                })
                : const SizedBox()
                : TryAgainWidget(
              onPressed: () async {
                await controller.statusGroupList();
              },
            ),
          ),
        ),
      ),
    );
  }


}
