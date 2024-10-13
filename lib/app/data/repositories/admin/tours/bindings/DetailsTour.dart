import 'package:e_tourism/app/data/repositories/admin/tours/controllers/DetailsTour.dart';
import 'package:e_tourism/app/data/repositories/admin/tours/controllers/tours.dart';
import 'package:get/get.dart';

class DetailsTourBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<DetailsTourController>(
      DetailsTourController(),
      permanent: true,
    );
  }
}
