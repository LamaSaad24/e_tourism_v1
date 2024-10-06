import 'package:e_tourism/app/data/repositories/admin/drivers/controllers/drivers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditDriverView extends GetView<DriversController> {
  @override
  Widget build(BuildContext context) {
    final driver = Get.arguments;
    final fNameController = TextEditingController(text: driver['fName']);
    final lNameController = TextEditingController(text: driver['lName']);
    final plateNumController = TextEditingController(text: driver['plateNum']);
    final descriptionController =
        TextEditingController(text: driver['description']);

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
                controller: fNameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    labelText: 'الاسم الأول')),
            SizedBox(height: 10.h),
            TextField(
                controller: lNameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    labelText: 'اسم العائلة')),
            SizedBox(height: 10.h),
            TextField(
                controller: plateNumController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    labelText: 'رقم اللوحة')),
            SizedBox(height: 10.h),
            TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    labelText: 'الوصف')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Map<String, dynamic> updatedDriver = {
                  'id': driver['id'],
                  'fName': fNameController.text,
                  'lName': lNameController.text,
                  'plateNum': plateNumController.text,
                  'description': descriptionController.text,
                };
                controller.updateDriver(updatedDriver);
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
