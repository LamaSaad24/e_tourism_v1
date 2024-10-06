import 'package:get/get.dart';

class DriversController extends GetxController {
  // البيانات الوهمية للمرشدين
  var drivers = <Map<String, dynamic>>[
    {
      'id': 1,
      'fName': 'أحمد',
      'lName': 'محمد',
      'plateNum': '123456789',
      'description': 'مرشد سياحي ذو خبرة عالية'
    },
    {
      'id': 2,
      'fName': 'سارة',
      'lName': 'أحمد',
      'plateNum': '987654321',
      'description': 'متخصصة في الجولات الثقافية'
    },
  ].obs;

  // دالة حذف المرشد
  void deleteDriver(int id) {
    drivers.removeWhere((driver) => driver['id'] == id);
  }

  // دالة تحديث المرشد
  void updateDriver(Map<String, dynamic> updatedDriver) {
    int index =
        drivers.indexWhere((driver) => driver['id'] == updatedDriver['id']);
    if (index != -1) {
      drivers[index] = updatedDriver;
    }
  }
}
