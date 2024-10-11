import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:e_tourism/app/modules/home/controllers/shopping_controller.dart';
import 'package:e_tourism/app/routes/app_pages.dart';
import 'category_controller.dart';
import 'favourite_controller.dart';
import 'home_controller.dart';

class MainNavController extends GetxController {
  final homeController = Get.find<HomeController>();
  // final categoryController = Get.find<CategoryController>();
  final shoppingController = Get.find<ShoppingController>();
  final favouriteController = Get.find<FavouriteController>();

  Rx<XFile?> storedImage = Rx<XFile?>(null);

  Future<void> signOut() async {
    deleteControllers();
    Get.offAllNamed(AppPages.LOGIN);
  }

  void deleteControllers() {
    Get.delete<HomeController>(
      force: true,
    );
    Get.delete<CategoryController>(
      force: true,
    );
    Get.delete<ShoppingController>(
      force: true,
    );
    Get.delete<FavouriteController>(
      force: true,
    );
  }




  @override
  void onInit() {
    super.onInit();
  }
}
