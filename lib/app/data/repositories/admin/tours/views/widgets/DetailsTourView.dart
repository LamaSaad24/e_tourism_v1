import 'package:e_tourism/app/data/repositories/admin/tours/controllers/DetailsTour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_tourism/utils/colors.dart';
import 'package:get/get.dart';

class DetailsTourView extends GetView<DetailsTourController> {
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final id = args['id'];
    controller.setTourId(id);

    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(' تفاصيل الرحلة'),
        backgroundColor: Colors.deepPurple,
      ),
      body: (Obx(() {
        return controller.isLoading.value
            ? Center(child: CupertinoActivityIndicator())
            : ListView(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Image.network(
                    "https://image.tmdb.org/t/p/original${controller.tour['backdrop_path']}",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 90.h,
                  ),
                  SizedBox(height: 15.h),
                  SizedBox(height: 30.h),
                  Text(
                    "${controller.tour['title']} العنوان : ",
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "${controller.tour['popularity']}  \$",
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: AppColors.customRed,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    controller.tour['vote_average'].toString(),
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: AppColors.customRed,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "${controller.tour['overview']}",
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              );
        })
      ),
    );
  }
}
