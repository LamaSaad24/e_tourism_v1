import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:e_tourism/app/components/custom_snackbar.dart';
import 'package:e_tourism/app/data/models/cart_item.dart';

class FavouriteController extends GetxController {
  final favouriteItems = [].obs;

  // Future<void> fetchFavouriteItems() async {
  //   String userId = FirebaseAuth.instance.currentUser!.uid;
  //   try {
  //     final cartData = await FirebaseFirestore.instance
  //         .collection('user_favourites')
  //         .doc(userId)
  //         .get();
  //
  //     final cartItemsData = cartData.data()?['favouriteItems'] ?? [];
  //     favouriteItems.value =
  //         cartItemsData.map((itemData) => CartItem.fromMap(itemData)).toList();
  //   } catch (e) {
  //     Logger().e('Error fetching favourites items: $e');
  //   }
  // }
  //
  // void removeFavouriteItem(String product_name) {
  //   final indexToRemove =
  //       favouriteItems.indexWhere((item) => item.product_name == product_name);
  //
  //   if (indexToRemove != -1) {
  //     favouriteItems.removeAt(indexToRemove);
  //     updateFirestoreFavourite();
  //     CustomSnackBar.showCustomSnackBar(
  //       title: 'نجحت العملية',
  //       message: 'تمت ازالة المنتج من المفضلات',
  //     );
  //   }
  // }
  //
  // void updateFirestoreFavourite() async {
  //   String userId = FirebaseAuth.instance.currentUser!.uid;
  //   final cartRef =
  //       FirebaseFirestore.instance.collection('user_favourites').doc(userId);
  //   try {
  //     await cartRef.set({
  //       'favouriteItems': favouriteItems.map((item) => item.toMap()).toList(),
  //     });
  //   } catch (e) {
  //     Logger().e('Error updating favourite Items in Firestore: $e');
  //   }
  // }

  @override
  void onInit() {
    // fetchFavouriteItems();
    super.onInit();
  }
}
