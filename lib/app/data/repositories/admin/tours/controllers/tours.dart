import 'package:get/get.dart';

class ToursController extends GetxController {
  // البيانات الوهمية للمرشدين
  var tours = <Map<String, dynamic>>[
    {
      'id': 1,
      'guide_id': '1',
      'driver_id': '8',
      'programme_id': '5',
      'price': '120',
      'number': '58'
    },
    {
      'id': 2,
      'guide_id': '1',
      'driver_id': '8',
      'programme_id': '5',
      'price': '120',
      'number': '58'
    },
  ].obs;

  // دالة حذف المرشد
  void deleteTours(int id) {
    tours.removeWhere((tour) => tour['id'] == id);
  }

  // دالة تحديث المرشد
  void updateTour(Map<String, dynamic> updatedTours) {
    int index = tours.indexWhere((tour) => tour['id'] == updatedTours['id']);
    if (index != -1) {
      tours[index] = updatedTours;
    }
  }
}
