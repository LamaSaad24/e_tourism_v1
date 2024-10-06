import 'package:e_tourism/app/data/repositories/admin/programmes/controllers/programmes.dart';
import 'package:get/get.dart';

class ProgrammesBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<ProgrammesController>(
      ProgrammesController(),
      permanent: true,
    );
  }
}
