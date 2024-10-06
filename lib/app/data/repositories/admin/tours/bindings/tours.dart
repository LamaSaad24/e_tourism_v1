import 'package:e_tourism/app/data/repositories/admin/tours/controllers/tours.dart';
import 'package:get/get.dart';

class ToursBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<ToursController>(
      ToursController(),
      permanent: true,
    );
  }
}
