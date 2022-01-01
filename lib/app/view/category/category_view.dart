import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ronventory_mobile/app/controller/settings/settings_controller.dart';
import 'package:ronventory_mobile/app/core/common_widgets/card_widget.dart';
import 'package:ronventory_mobile/app/core/common_widgets/sidebar.dart';
import 'package:ronventory_mobile/app/core/common_widgets/try_again.widget.dart';
import 'package:ronventory_mobile/app/general/color/app_colors.dart';
import 'package:ronventory_mobile/app/general/text/app_text.style.dart';
import 'package:ronventory_mobile/app/controller/category/category_controller.dart';
import 'package:skeletons/skeletons.dart';

class CategoryView extends GetView<CategoryController> {
  final SettingsController _settingsController = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        drawer: SideBar(),
        appBar: AppBar(
          title: Text(
            "Kategoriler",
            style: AppTextStyle().kTextStyleFourteenWithThemeColor,
          ),
          backgroundColor: AppColors().kAppBarBackground,
        ),
        body: Obx(() => Skeleton(
              isLoading: controller.dataProcessing.value,
              skeleton: SkeletonListView(),
              child: controller.categoryModel != null
                  ? ListView.builder(
                      itemCount: controller.categoryListTask.length,
                      itemBuilder: (BuildContext context, int index) {
                        controller.categoryId.value =
                            controller.categoryListTask[index].id!;
                        return CardWidget(
                          title: controller.categoryListTask[index].title!,
                          borderColor: Colors.white,
                          shadowColor: Colors.white,
                          children: [
                            Expanded(
                              child: Text(
                                controller.categoryListTask[index].slug!,
                                style: AppTextStyle().kTextStyleEmail,
                              ),
                            ),
                            Expanded(
                              child: TextButton(
                                  onPressed: () async {

                                    controller
                                        .categoryUpdateMethod(context, index)
                                        .show();
                                    await _settingsController.getSettings();

                                  },
                                  child: const Text(
                                    'Güncelle',
                                    style: TextStyle(color: Colors.green),
                                  )),
                            ),
                          ],
                        );
                      })
                  : TryAgainWidget(
                      onPressed: () async {
                        await controller.categoryList();
                      },
                    ),
            )),
      ),
    );
  }
}
