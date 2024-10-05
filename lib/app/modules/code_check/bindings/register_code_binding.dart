import 'package:get/get.dart';
import 'package:e_tourism/app/data/repositories/user/auth/auth_repository.dart';
import 'package:e_tourism/app/modules/code_check/controllers/register_code_controller.dart';

class RegisterCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterCodeController>(
      () => RegisterCodeController(),
    );
    Get.lazyPut<AuthRepository>(
      () => AuthRepository(),
    );
  }
}
