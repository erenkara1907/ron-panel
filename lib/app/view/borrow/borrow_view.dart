import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ronventory_mobile/app/controller/borrow/borrow_controller.dart';
import 'package:ronventory_mobile/app/controller/settings/settings_controller.dart';
import 'package:ronventory_mobile/app/core/common_widgets/card_widget.dart';
import 'package:ronventory_mobile/app/core/common_widgets/sidebar.dart';
import 'package:ronventory_mobile/app/core/common_widgets/try_again.widget.dart';
import 'package:ronventory_mobile/app/general/color/app_colors.dart';
import 'package:ronventory_mobile/app/general/text/app_text.style.dart';
import 'package:skeletons/skeletons.dart';

class BorrowView extends GetView<BorrowController> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        drawer: SideBar(),
        appBar: AppBar(
          title: Text(
            "Ödünç Alınan Ürünler",
            style: AppTextStyle().kTextStyleFourteenWithThemeColor,
          ),
          backgroundColor: AppColors().kAppBarBackground,
        ),
        body: Obx(
          () => Skeleton(
            isLoading: controller.dataProcessing.value,
            skeleton: SkeletonListView(),
            child: controller.borrowModel != null
                ? controller.dataProcessing.value == false
                    ? ListView.builder(
                        itemCount: controller.borrowListTask.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CardWidget(
                            title:
                                '${controller.borrowListTask[index].productId}',
                            borderColor: Colors.white,
                            shadowColor: Colors.white,
                            children: [
                              Text(
                                '${controller.borrowListTask[index].userId}',
                                style: AppTextStyle().kTextStyleEmail,
                              ),
                            ],
                          );
                        })
                    : const Text(
                        'Hiçbir veri bulunamadı',
                        style: TextStyle(color: Colors.white),
                      )
                : TryAgainWidget(
              onPressed: () async {
                await controller.borrowList();
              },
            ),
          ),
        ),
      ),
    );
  }
}
