import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_tourism/app/data/repositories/admin/guides/controllers/guides.dart';

class EditGuideView extends GetView<GuidesController> {
  @override
  Widget build(BuildContext context) {
    final guide = Get.arguments;
    final fNameController = TextEditingController(text: guide['fName']);
    final lNameController = TextEditingController(text: guide['lName']);
    final mobileController = TextEditingController(text: guide['mobile']);
    final addressController = TextEditingController(text: guide['Address']);
    final descriptionController =
        TextEditingController(text: guide['description']);

    return Scaffold(
      appBar: AppBar(
        title: Text('تعديل'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: fNameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    labelText: 'الاسم الأول')),
            TextField(
                controller: lNameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    labelText: 'اسم العائلة')),
            TextField(
                controller: mobileController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    labelText: 'رقم الهاتف')),
            TextField(
                controller: addressController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    labelText: 'العنوان')),
            TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    labelText: 'الوصف')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Map<String, dynamic> updatedGuide = {
                  'id': guide['id'],
                  'fName': fNameController.text,
                  'lName': lNameController.text,
                  'mobile': mobileController.text,
                  'Address': addressController.text,
                  'description': descriptionController.text,
                };
                controller.updateGuide(updatedGuide);
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
