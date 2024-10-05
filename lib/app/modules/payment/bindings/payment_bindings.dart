import 'package:get/get.dart';
import 'package:e_tourism/app/modules/payment/controllers/payment.controller.dart';

class PaymentBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentController>(
      () => PaymentController(),
    );
  }
}
