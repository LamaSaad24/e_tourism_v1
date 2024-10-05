import 'package:get/get.dart';

class TouristsController extends GetxController {
  // البيانات الوهمية للمرشدين
  var guides = <Map<String, dynamic>>[
    {
      'id': 1,
      'fName': 'أحمد',
      'lName': 'محمد',
      'Address': 'عمان',
      'mobile': '123456789',
      'description': 'مرشد سياحي ذو خبرة عالية'
    },
    {
      'id': 2,
      'fName': 'سارة',
      'lName': 'أحمد',
      'Address': 'القدس',
      'mobile': '987654321',
      'description': 'متخصصة في الجولات الثقافية'
    },
  ].obs;

  // دالة حذف المرشد
  void deleteGuide(int id) {
    guides.removeWhere((guide) => guide['id'] == id);
  }

  // دالة تحديث المرشد
  void updateGuide(Map<String, dynamic> updatedGuide) {
    int index = guides.indexWhere((guide) => guide['id'] == updatedGuide['id']);
    if (index != -1) {
      guides[index] = updatedGuide;
    }
  }
}
