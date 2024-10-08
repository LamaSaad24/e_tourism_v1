import 'package:e_tourism/app/modules/tour_details/controllers/tour_details_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:e_tourism/app/modules/tour_details/controllers/tour_details_controller.dart';
import 'package:e_tourism/app/modules/tour_details/views/widgets/app_bar_widget.dart';
import 'package:e_tourism/app/modules/tour_details/views/widgets/buttons_widget.dart';
import 'package:e_tourism/app/modules/tour_details/views/widgets/header_title.dart';
import 'package:e_tourism/app/modules/tour_details/views/widgets/images_page_view.dart';
import 'package:e_tourism/app/modules/tour_details/views/widgets/page_indicator.dart';
import 'package:e_tourism/app/modules/tour_details/views/widgets/related_tours.dart';
import 'package:e_tourism/utils/colors.dart';

class TourDetailsView extends GetView<TourDetailsController> {
  @override
  Widget build(BuildContext context) {
    // return Obx(() {
    return Scaffold(
      appBar: TourAppBar(),
      body:
          // controller.isLoading.value == true
          //     ? Center(child: CupertinoActivityIndicator())
          //     :
          ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        physics: NeverScrollableScrollPhysics(),
        children: [
          // ImagesPageView(controller: controller),
          Image.asset(
            "assets/images/1.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: 90.h,
          ),
          SizedBox(height: 15.h),
          PageIndicator(controller: controller),
          SizedBox(height: 30.h),
          Text(
            // controller.tour['title'],
            "tour1",
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            // controller.tour['price'],
            "120\$",
            style: TextStyle(
              fontSize: 17.sp,
              color: AppColors.customRed,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            // controller.tour['number'],
            "50",
            style: TextStyle(
              fontSize: 17.sp,
              color: AppColors.customRed,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            // controller.tour['description'],
            "this is description",
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 15.sp,
            ),
          ),
          SizedBox(height: 20.h),
          HeaderTitle(),
          SizedBox(height: 20.h),
          // RelatedTours(controller: controller),
          SizedBox(height: 20.h),
          ButtonsWidget(controller: controller),
        ],
      ),
    );
    // });
  }
}
