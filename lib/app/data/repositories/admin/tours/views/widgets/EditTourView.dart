import 'package:e_tourism/app/data/repositories/admin/tours/controllers/DetailsTour.dart';
import 'package:e_tourism/app/modules/code_check/views/register_code_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditTourView extends GetView<DetailsTourController> {
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final id = args['id'];
    controller.setTourId(id);

    return Scaffold(
      appBar: AppBar(
        title: Text('تعديل'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        else {
          // تعبئة الحقول بالبيانات الحالية
          final tour = controller.tour;
          final titleController = TextEditingController(text: tour['title'].toString());
          final descController = TextEditingController(text: tour['overview'].toString());
          final guiedController = TextEditingController(text: tour['imdb_id'].toString());
          // final driverController = TextEditingController(text: tour['budget'].toString());
          final driverController = TextEditingController(text: "1");
          final programmeController = TextEditingController(text: tour['popularity'].toString());
          final priceController = TextEditingController(text: tour['vote_count'].toString());
          final numberController = TextEditingController(text: tour['revenue'].toString());
          final dateController = TextEditingController(text: tour['release_date'].toString());

          return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                                color: Colors.grey, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                                color: Colors.grey, width: 1.0),
                          ),
                          labelText: 'العنوان')),
                  SizedBox(height: 10.h),
                  TextField(
                      controller: descController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                                color: Colors.grey, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                                color: Colors.grey, width: 1.0),
                          ),
                          labelText: 'الوصف')),
                  SizedBox(height: 10.h),
                  DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(color: Colors.grey, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          labelText: 'رقم السائق',
                        ),
                        value: driverController.text,
                        isExpanded: true,
                        icon: Icon(Icons.arrow_drop_down_outlined),
                        items: controller.drivers.map<DropdownMenuItem<String>>((driver) {
                          return DropdownMenuItem<String>(
                            value: driver['id'].toString(), // ID السائق
                            child: Text(driver['name']),   // اسم السائق
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          // driverController.text = newValue;
                          print("Selected Driver ID: $driverController");
                        },
                  ),
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

                  SizedBox(height: 10.h),
                  TextField(
                      controller: dateController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(color: Colors.grey, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          labelText: 'التاريخ')),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Map<String, dynamic> updatedTour = {
                        'id': tour['id'],
                        'title': titleController.text,
                        'desc': descController.text,
                        'guied_id': guiedController.text,
                        'driver_id': driverController.text,
                        'programme_id': programmeController.text,
                        'price_id': priceController.text,
                        'number_id': numberController.text,
                        'date': dateController.text,
                      };
                      controller.updateTour(updatedTour);
                      // Get.back(); // العودة إلى صفحة المرشدين
                    },
                    style:
                    ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple),
                    child: Text('تحديث', style: TextStyle(color: Colors.white)),
                  ),
                ],
              )
          );
        }
      }),
    );
  }

}