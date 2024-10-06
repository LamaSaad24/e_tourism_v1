import 'package:e_tourism/app/data/repositories/admin/programmes/controllers/programmes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProgrammeView extends GetView<ProgrammesController> {
  @override
  Widget build(BuildContext context) {
    final programme = Get.arguments;
    final TypeController = TextEditingController(text: programme['Type']);
    final NameController = TextEditingController(text: programme['Name']);
    final descriptionController =
        TextEditingController(text: programme['description']);

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
                controller: TypeController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    labelText: 'النوع ')),
            SizedBox(height: 10.h),
            TextField(
                controller: NameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    labelText: 'اسم ')),
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
                Map<String, dynamic> updatedProgrammes = {
                  'id': programme['id'],
                  'Type': TypeController.text,
                  'Name': NameController.text,
                  'description': descriptionController.text,
                };
                controller.updateProgrammes(updatedProgrammes);
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
