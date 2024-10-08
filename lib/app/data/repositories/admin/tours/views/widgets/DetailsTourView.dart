import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_tourism/app/modules/tour_details/views/widgets/header_title.dart';
import 'package:e_tourism/utils/colors.dart';

class DetailsTourView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Obx(() {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(' الرحلات'),
        backgroundColor: Colors.deepPurple,
      ),
      sideBar: SideBar(
        items: const [
          AdminMenuItem(
            title: 'الصفحة الرئيسية',
            route: '/home_dash',
            icon: Icons.dashboard,
          ),
          AdminMenuItem(
            title: 'الدليل السياحيين',
            icon: Icons.drive_eta,
            route: '/guides',
          ),
          AdminMenuItem(
            title: 'السائقين ',
            icon: Icons.drive_eta,
            route: '/drivers',
          ),
          AdminMenuItem(
            title: 'البرامج السياحية',
            icon: Icons.add_chart,
            route: '/programmes',
          ),
          AdminMenuItem(
            title: 'الرحلات ',
            icon: Icons.tour,
            route: '/tours',
          ),
          AdminMenuItem(
            title: 'السياح ',
            icon: Icons.drive_eta,
            route: '/tourists',
          ),
          AdminMenuItem(
            title: 'تسجيل الدخول ',
            icon: Icons.login,
            route: '/login',
          ),
        ],
        selectedRoute: '/',
        onSelected: (item) {
          if (item.route != null) {
            Navigator.of(context).pushNamed(item.route!);
          }
        },
      ),
      body: ListView(
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
        ],
      ),
    );
  }
}
