import 'package:e_tourism/app/modules/home/views/widgets/DatePickerPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:e_tourism/app/modules/home/controllers/home_controller.dart';
import 'package:e_tourism/app/modules/home/views/widgets/category_item_title.dart';
import 'package:e_tourism/app/modules/home/views/widgets/category_items_list.dart';
import 'package:e_tourism/app/modules/home/views/widgets/tour_items_list.dart';
import 'package:e_tourism/app/modules/home/views/widgets/search_widget.dart';

class HomeNavPage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
      child: ListView(
        children: [
          SearchWidget(controller: controller),
          SizedBox(height: 40.h),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DatePickerPage(),
                ),
              );
            },
            child: Text('البحث حسب التاريخ',style: TextStyle(color: Colors.white) ),
          ),
          CategoryItemTitle(categoryTitle: 'الرحلات'),
          // SizedBox(height: 15.h),
          // CategoryItemsList(controller: controller),
          SizedBox(height: 10.h),
          ProductItemsList(
            controller: controller,
          ),
        ],
      ),
    );
  }
}
