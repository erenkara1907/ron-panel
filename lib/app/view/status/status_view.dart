import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ronventory_mobile/app/controller/status/status_controller.dart';
import 'package:ronventory_mobile/app/core/common_widgets/card_widget.dart';
import 'package:ronventory_mobile/app/core/common_widgets/sidebar.dart';
import 'package:ronventory_mobile/app/core/common_widgets/try_again.widget.dart';
import 'package:ronventory_mobile/app/general/color/app_colors.dart';
import 'package:ronventory_mobile/app/general/text/app_text.style.dart';
import 'package:skeletons/skeletons.dart';

class StatusView extends GetView<StatusController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        drawer: SideBar(),
        appBar: AppBar(
          title: Text(
            "Statüler",
            style: AppTextStyle().kTextStyleFourteenWithThemeColor,
          ),
          backgroundColor: AppColors().kAppBarBackground,
        ),
        body: Obx(
          () => Skeleton(
            isLoading: controller.dataProcessing.value,
            skeleton: SkeletonListView(),
            child: controller.statusModel != null
                ? controller.dataProcessing.value == false
                ? ListView.builder(
                itemCount: controller.statusListTask.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardWidget(
                    title: controller.statusListTask[index].title!,
                    borderColor: Colors.white,
                    shadowColor: Colors.white,
                    children: [
                      Expanded(
                        child: Text(
                          controller.statusListTask[index].title!,
                          style: AppTextStyle().kTextStyleEmail,
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                            onPressed: () {
                              controller
                                  .statusUpdateMethod(context, index)
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
                await controller.statusList();
              },
            ),
          ),
        ),
      ),
    );
  }
}
