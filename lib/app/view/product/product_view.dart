import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ronventory_mobile/app/controller/product/product_controller.dart';
import 'package:ronventory_mobile/app/core/common_widgets/card_widget.dart';
import 'package:ronventory_mobile/app/core/common_widgets/sidebar.dart';
import 'package:ronventory_mobile/app/core/common_widgets/try_again.widget.dart';
import 'package:ronventory_mobile/app/general/color/app_colors.dart';
import 'package:ronventory_mobile/app/general/text/app_text.style.dart';
import 'package:skeletons/skeletons.dart';

class ProductView extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        drawer: SideBar(),
        appBar: AppBar(
          title: Text(
            "Ürünler",
            style: AppTextStyle().kTextStyleFourteenWithThemeColor,
          ),
          backgroundColor: AppColors().kAppBarBackground,
        ),
        body: Obx(
          () => Skeleton(
            isLoading: controller.dataProcessing.value,
            skeleton: SkeletonListView(),
            child: controller.productModel != null
                ? controller.dataProcessing.value == false
                ? ListView.builder(
                itemCount: controller.productListTask.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardWidget(
                    title: '${controller.productListTask[index].title}',
                    borderColor: Colors.white,
                    shadowColor: Colors.white,
                    children: [
                      Text(
                        '${controller.productListTask[index].createdAt}',
                        style: AppTextStyle().kTextStyleEmail,
                      ),
                      TextButton(
                          onPressed: () {
                            controller
                                .productUpdateMethod(context, index)
                                .show();
                          },
                          child: const Text(
                            'Güncelle',
                            style: TextStyle(color: Colors.green),
                          ))
                    ],
                  );
                })
                : const SizedBox()
                : TryAgainWidget(
              onPressed: () async {
                await controller.productList();
              },
            ),
          ),
        ),
      ),
    );
  }
}
