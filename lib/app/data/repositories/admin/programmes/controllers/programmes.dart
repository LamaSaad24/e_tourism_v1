import 'package:get/get.dart';

class ProgrammesController extends GetxController {
  // البيانات الوهمية للمرشدين
  var programmes = <Map<String, dynamic>>[
    {
      'id': 1,
      'Type': 'ترفيهي',
      'Name': 'محمد',
      'description': 'مرشد سياحي ذو خبرة عالية'
    },
    {
      'id': 2,
      'Type': 'ترفيهي',
      'Name': 'محمد',
      'description': 'مرشد سياحي ذو خبرة عالية'
    },
  ].obs;

  // دالة حذف المرشد
  void deleteProgrammes(int id) {
    programmes.removeWhere((prog) => prog['id'] == id);
  }

  // دالة تحديث المرشد
  void updateProgrammes(Map<String, dynamic> updatedProgrammes) {
    int index =
        programmes.indexWhere((prog) => prog['id'] == updatedProgrammes['id']);
    if (index != -1) {
      programmes[index] = updatedProgrammes;
    }
  }
}
