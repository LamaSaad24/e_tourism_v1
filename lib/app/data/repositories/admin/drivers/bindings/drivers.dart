import 'package:e_tourism/app/data/repositories/admin/drivers/controllers/drivers.dart';
import 'package:get/get.dart';

class DriversBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<DriversController>(
      DriversController(),
      permanent: true,
    );
  }
}
