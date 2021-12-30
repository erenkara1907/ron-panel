import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ronventory_mobile/app/controller/department/department_controller.dart';
import 'package:ronventory_mobile/app/controller/user/user_controller.dart';
import 'package:ronventory_mobile/app/core/common_widgets/card_widget.dart';
import 'package:ronventory_mobile/app/core/common_widgets/sidebar.dart';
import 'package:ronventory_mobile/app/core/common_widgets/try_again.widget.dart';
import 'package:ronventory_mobile/app/general/color/app_colors.dart';
import 'package:ronventory_mobile/app/general/text/app_text.style.dart';
import 'package:skeletons/skeletons.dart';

class DepartmentView extends GetView<DepartmentController> {
  late final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        drawer: SideBar(),
        appBar: AppBar(
          title: Text(
            "Departmantlar",
            style: AppTextStyle().kTextStyleFourteenWithThemeColor,
          ),
          backgroundColor: AppColors().kAppBarBackground,
        ),
        body: Obx(() => Skeleton(
          isLoading: controller.dataProcessing.value,
          skeleton: SkeletonListView(),
          child: controller.departmentModel != null

              ? ListView.builder(
              itemCount: controller.departmentListTask.length,
              itemBuilder: (BuildContext context, int index) {

                return CardWidget(
                  title: controller.departmentListTask[index].title!,
                  borderColor: Colors.white,
                  shadowColor: Colors.white,
                  children: [
                    Expanded(
                      child: Text(
                        controller.departmentListTask[index].title!,
                        style: AppTextStyle().kTextStyleEmail,
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                          onPressed: () {
                            controller
                                .departmentUpdateMethod(context, index)
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

              : TryAgainWidget(
            onPressed: () async {
              await controller.departmentList();
            },
          ),
        )),
      ),
    );
  }
}
