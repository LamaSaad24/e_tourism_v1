import 'package:get/get.dart';

class TouristsController extends GetxController {
  // البيانات الوهمية للمرشدين
  var tourists = <Map<String, dynamic>>[
    {
      'id': 1,
      'fName': 'أحمد',
      'lName': 'محمد',
      'description': 'مرشد سياحي ذو خبرة عالية',
      'tour_id': '1'
    },
    {
      'id': 2,
      'fName': 'سارة',
      'lName': 'أحمد',
      'description': 'متخصصة في الجولات الثقافية',
      'tour_id': '2'
    },
  ].obs;

  // دالة حذف المرشد
  void deleteTourist(int id) {
    tourists.removeWhere((tourist) => tourist['id'] == id);
  }

  // دالة تحديث المرشد
  void updateTourist(Map<String, dynamic> updatedTourist) {
    int index = tourists
        .indexWhere((tourists) => tourists['id'] == updatedTourist['id']);
    if (index != -1) {
      tourists[index] = updatedTourist;
    }
  }
}
