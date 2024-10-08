import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:e_tourism/app/modules/home/controllers/home_controller.dart';
import 'package:e_tourism/app/routes/app_pages.dart';
import 'package:e_tourism/utils/colors.dart';

class ProductItemsList extends StatelessWidget {
  const ProductItemsList({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return CupertinoActivityIndicator();
      } else if (controller.toursList.isEmpty) {
        return Center(
          child: Text(
            'لا توجد عناصر لعرضها 🙁',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      } else
        return GridView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 10.h,
          ),
          itemCount: controller.toursList.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.toNamed(
                  AppPages.TOUR_DETAILS,
                  arguments: controller.toursList[index]['title'],
                );
              },
              child: Card(
                elevation: 4,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      controller.toursList[index]['image'],
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 90.h,
                    ),
                    Positioned(
                      top: 10.h,
                      right: 110.w,
                      child: Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white30,
                        ),
                        child: InkWell(
                          onTap: () {
                            controller.performFavourite(
                                controller.toursList[index]['title']);
                          },
                          child: Icon(
                            controller.toursList[index]['is_favourite'] == true
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            controller.toursList[index]['title'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        Text(
                          controller.toursList[index]["price"] + "\$",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: AppColors.customRed,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
    });
  }
}
