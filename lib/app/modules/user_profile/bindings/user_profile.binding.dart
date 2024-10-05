import 'package:get/get.dart';
import 'package:e_tourism/app/modules/user_profile/controllers/user_profile.controller.dart';

class UserProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserProfileController>(
      UserProfileController(),
      permanent: true,
    );
  }
}
