import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_tourism/app/modules/product_details/controllers/product_details_controller.dart';

class ImagesPageView extends StatelessWidget {
  const ImagesPageView({
    super.key,
    required this.controller,
  });

  final ProductDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230.h,
      child: PageView.builder(
        itemCount: 3,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        onPageChanged: (index) => controller.changePage(index),
        itemBuilder: (context, index) {
          return Image.network(
            controller.product['product_image'],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
