import 'package:e_tourism/app/data/repositories/admin/tourists/controllers/tourists.dart';
import 'package:get/get.dart';

class TouristsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<TouristsController>(
      TouristsController(),
      permanent: true,
    );
  }
}
