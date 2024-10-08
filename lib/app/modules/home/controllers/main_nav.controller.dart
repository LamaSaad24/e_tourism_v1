import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:e_tourism/app/modules/home/controllers/shopping_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:e_tourism/app/routes/app_pages.dart';
import 'category_controller.dart';
import 'favourite_controller.dart';
import 'home_controller.dart';

class MainNavController extends GetxController {
  final homeController = Get.find<HomeController>();
  final categoryController = Get.find<CategoryController>();
  final shoppingController = Get.find<ShoppingController>();
  final favouriteController = Get.find<FavouriteController>();

  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  Rx<XFile?> storedImage = Rx<XFile?>(null);

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
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

  Future<List<Reference>> read() async {
    ListResult listResult =
        await _firebaseStorage.ref('users_images').listAll();
    if (listResult.items.isNotEmpty) {
      return listResult.items;
    }
    return [];
  }

  Future<void> loadAndSetImage() async {
    final imageReferences = await read();
    if (imageReferences.isNotEmpty) {
      final latestImageReference = imageReferences.last;
      final imageBytes = await latestImageReference.getData();
      final tempDir = await getTemporaryDirectory();
      final imagePath = "${tempDir.path}/${latestImageReference.name}";
      File(imagePath).writeAsBytesSync(imageBytes!);
      storedImage.value = XFile(imagePath);
    }
  }

  @override
  void onInit() {
    loadAndSetImage();
    super.onInit();
  }
}
