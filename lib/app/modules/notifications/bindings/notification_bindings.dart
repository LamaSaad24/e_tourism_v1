import 'package:get/get.dart';
import 'package:e_tourism/app/modules/notifications/controllers/notification_controller.dart';

class NotificationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationController>(
      () => NotificationController(),
    );
  }
}
