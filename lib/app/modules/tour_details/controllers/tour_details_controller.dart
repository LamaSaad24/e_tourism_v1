import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:e_tourism/app/components/custom_snackbar.dart';
import 'package:e_tourism/app/modules/home/controllers/shopping_controller.dart';

class TourDetailsController extends GetxController {
  RxInt photoIndex = 0.obs;
  RxInt tourIndex = 0.obs;
  RxBool isFavourite = false.obs;
  RxBool isLoading = false.obs;
  String selectedtour = Get.arguments;
  var tour;

  void changePage(int index) {
    photoIndex.value = index;
  }

  void selectFavouriteIndex(int index) {
    tourIndex.value = index;
    isFavourite.value = !isFavourite.value;
  }

  int getSelectedIndex() {
    return tourIndex.value;
  }

  Future<DocumentSnapshot?> gettourByName(String name) async {
    isLoading.value = true;
    try {
      CollectionReference collection =
          FirebaseFirestore.instance.collection('tours');

      QuerySnapshot querySnapshot =
          await collection.where('tour_name', isEqualTo: name).get();

      if (querySnapshot.docs.isNotEmpty) {
        isLoading.value = false;
        return querySnapshot.docs.first;
      } else {
        return null;
      }
    } catch (e) {
      Logger().e(e);
      isLoading.value = false;
      return null;
    }
  }

  fetchtour() async {
    isLoading.value = true;
    DocumentSnapshot? document = await gettourByName(selectedtour);
    if (document != null) {
      tour = document.data();
      isLoading.value = false;
    } else {
      Logger().e('Document not found');
    }
  }

  void addtourToCart() async {
    isLoading.value = true;
    var userId = FirebaseAuth.instance.currentUser!.uid;
    final cartRef =
        FirebaseFirestore.instance.collection('user_carts').doc(userId);
    if (tour != null) {
      cartRef.set(
        {
          'cartItems': FieldValue.arrayUnion([
            {
              'tour_name': tour['tour_name'],
              'tour_description': tour['tour_description'],
              'tour_price': tour['tour_price'],
              'tour_image': tour['tour_image'],
              'category_name': tour['category_name'],
              'is_favourite': false,
            }
          ])
        },
        SetOptions(
          merge: true,
        ),
      );
      isLoading.value = false;
      CustomSnackBar.showCustomSnackBar(
        title: 'تمت الاضافة بنجاح',
        message: 'تم اضافة هذا المنتج الى سلة الطلبات 😍',
      );
      Get.find<ShoppingController>().fetchCartItems();
    } else {
      CustomSnackBar.showCustomErrorSnackBar(
        title: 'حدث خطأ ما',
        message: 'لم تنجح عملية الاضافة ، يرجى اعادة المحاولة 🙁',
      );
    }
  }

  @override
  void onInit() async {
    await fetchtour();
    super.onInit();
  }
}
