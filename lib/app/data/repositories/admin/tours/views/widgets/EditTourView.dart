import 'package:e_tourism/app/data/repositories/admin/tours/controllers/tours.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditTourView extends GetView<ToursController> {
  @override
  Widget build(BuildContext context) {
    final tour = Get.arguments;
    final guiedController = TextEditingController(text: tour['guied_id']);
    final driverController = TextEditingController(text: tour['driver_id']);
    final programmeController =
        TextEditingController(text: tour['programme_id']);
    final priceController = TextEditingController(text: tour['price']);
    final numberController = TextEditingController(text: tour['number']);

    return Scaffold(
      appBar: AppBar(
        title: Text('تعديل'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            TextField(
                controller: guiedController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    labelText: ' رقم الدليل')),
            SizedBox(height: 10.h),
            TextField(
                controller: driverController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    labelText: 'رقم السائق')),
            SizedBox(height: 10.h),
            TextField(
                controller: programmeController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    labelText: 'رقم البرنامج')),
            SizedBox(height: 10.h),
            TextField(
                controller: priceController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    labelText: 'السعر')),
            SizedBox(height: 10.h),
            TextField(
                controller: numberController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    labelText: 'الرقم')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Map<String, dynamic> updatedTour = {
                  'id': tour['id'],
                  'guied_id': guiedController.text,
                  'driver_id': driverController.text,
                  'programme_id': programmeController.text,
                  'price_id': priceController.text,
                  'number_id': numberController.text,
                };
                controller.updateTour(updatedTour);
                Get.back(); // العودة إلى صفحة المرشدين
              },
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              child: Text('تحديث', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
