import 'package:e_tourism/app/data/repositories/admin/guides/controllers/guides.dart';
import 'package:get/get.dart';

class DriversBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<GuidesController>(
      GuidesController(),
      permanent: true,
    );
  }
}
