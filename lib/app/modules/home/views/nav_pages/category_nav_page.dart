import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:e_tourism/app/modules/home/controllers/category_controller.dart';
import 'package:e_tourism/app/modules/home/views/widgets/category_nav_list.dart';
import 'package:e_tourism/app/modules/home/views/widgets/category_products.dart';

class CategoryNavPage extends GetView<CategoryController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () {
          return controller.isLoading.value
              ? Center(
                  child: CupertinoActivityIndicator(),
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CategoryNavList(controller: controller),
                    CategoryProducts(controller: controller),
                  ],
                );
        },
      ),
    );
  }
}
