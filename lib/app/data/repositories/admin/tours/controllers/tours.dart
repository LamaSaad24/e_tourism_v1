import 'package:get/get.dart';

class ToursController extends GetxController {
  // البيانات الوهمية للمرشدين
  var tours = <Map<String, dynamic>>[
    {
      'id': 1,
      'title':'الرحلةالاولى ',
      'guide_id': '1',
      'driver_id': '8',
      'programme_id': '5',
      'price': '120',
      'number': '58',
      'type':'مغلق',
      'date':'20/10/2024',
      'image':'assets/images/1.png'
    },
    {
      'id': 2,
      'title':'الرحلة الثانية',
      'guide_id': '1',
      'driver_id': '8',
      'programme_id': '5',
      'price': '120',
      'number': '58',
      'type':'بالانتظار',
      'date':'20/10/2024',
      'image':'assets/images/2.png'
    },
    {
      'id': 2,
      'title':'الرحلة الثالثة',
      'guide_id': '1',
      'driver_id': '8',
      'programme_id': '5',
      'price': '120',
      'number': '58',
      'type':'مفتوح',
      'date':'20/10/2024',
      'image':'assets/images/3.png'
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
