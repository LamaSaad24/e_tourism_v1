import 'package:get/get.dart';
import 'package:e_tourism/app/modules/splash/controller/launch_controller.dart';

class LaunchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaunchController>(
      () => LaunchController(),
    );
  }
}
