import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:e_tourism/app/components/custom_snackbar.dart';
import 'package:e_tourism/app/modules/home/controllers/favourite_controller.dart';

class HomeController extends GetxController {
  late List<dynamic> users;
  final formKey = GlobalKey<FormState>();
  final editController = TextEditingController();
  final tabIndex = 0.obs;
  var tour;
  RxString selectedTour = ''.obs;
  RxBool isLoading = false.obs;
  List<Map<String, dynamic>> categoriesList = [];
  RxList<dynamic> toursList = <Map<String, dynamic>>[].obs;
  RxList<dynamic> searchedTours = RxList<Map<String, dynamic>>([]);

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  void setFavouriteTour(String tour_name) {
    selectedTour.value = tour_name;
  }

  String changeTabTitle() {
    if (tabIndex.value == 0) {
      return 'الرئيسية';
    } else if (tabIndex.value == 1) {
      return 'الرحلات';
    } else if (tabIndex.value == 2) {
      return 'رحلاتي';
    } else if (tabIndex.value == 3) {
      return 'المفضلة';
    }
    return 'بدون عنوان';
  }

  Future<dynamic> searchTours(String keyword) async {
    if (keyword.isNotEmpty) {
      final QuerySnapshot query = await FirebaseFirestore.instance
          .collection('tours')
          .where('tour_name', isGreaterThanOrEqualTo: keyword)
          .where('tour_name', isLessThanOrEqualTo: keyword + '\uf8ff')
          .get();

      searchedTours.value =
          query.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
      return searchedTours;
    } else {
      searchedTours.clear();
    }
  }

  Future<List<Map<String, dynamic>>> getCategoriesList() async {
    isLoading.value = true;
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('categories').get();
      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        Map<String, dynamic> categoryData =
            (documentSnapshot.data() as Map<String, dynamic>);
        categoriesList.add(categoryData);
        isLoading.value = false;
      }
    } catch (e) {
      Logger().e(e);
    }
    return categoriesList;
  }

  Future<RxList> getToursList() async {
    isLoading.value = true;
    try {
      // QuerySnapshot querySnapshot =
      // await FirebaseFirestore.instance.collection('tours').get();
      // for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
      //   Map<String, dynamic> tourData =
      //       (documentSnapshot.data() as Map<String, dynamic>);
      //   toursList.add(tourData);
      //   isLoading.value = false;
      // }
      var tourData = [
        {
          'id': 1,
          'guide_id': '1',
          'driver_id': '8',
          'programme_id': '5',
          'title':'tour1',
          'price': '120',
          'number': '34',
          'image':"assets/images/1.png",
          'is_favourite':true,
        },
        {
          'id': 2,
          'guide_id': '1',
          'driver_id': '8',
          'programme_id': '5',
          'price': '120',
          'title': 'tour2',
          'number': '58',
          'image': "assets/images/3.png",
          'is_favourite':true,
        },
      ].obs;
      toursList.addAll(tourData);
      isLoading.value = false;
    } catch (e) {
      Logger().e(e);
    }
    return toursList;
  }

  Future<DocumentSnapshot?> getTourByName() async {
    isLoading.value = true;
    try {
      CollectionReference collection =
          FirebaseFirestore.instance.collection('tours');

      QuerySnapshot querySnapshot = await collection
          .where('tour_name', isEqualTo: selectedTour.value)
          .get();

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

  fetchTour() async {
    isLoading.value = true;
    DocumentSnapshot? document = await getTourByName();
    if (document != null) {
      tour = document.data();
      isLoading.value = false;
    } else {
      Logger().e('Document not found');
    }
  }

  void addTourToFavourites() async {
    isLoading.value = true;
    var userId = FirebaseAuth.instance.currentUser!.uid;

    if (tour != null) {
      final tourName = tour['tour_name'];

      try {
        final tourQuery = await FirebaseFirestore.instance
            .collection('tours')
            .where('tour_name', isEqualTo: tourName)
            .get();

        if (tourQuery.docs.isNotEmpty) {
          final tourDocRef = tourQuery.docs.first.reference;
          await tourDocRef.update({
            'is_favourite': true,
          });

          final tourIndex = toursList.indexWhere(
            (tour) => tour['tour_name'] == tourName,
          );
          if (tourIndex != -1) {
            toursList[tourIndex]['is_favourite'] = true;
          }

          final cartRef = FirebaseFirestore.instance
              .collection('user_favourites')
              .doc(userId);

          await cartRef.set({
            'favouriteItems': FieldValue.arrayUnion([
              {
                'tour_name': tourName,
                'tour_description': tour['tour_description'],
                'tour_price': tour['tour_price'],
                'tour_image': tour['tour_image'],
                'category_name': tour['category_name'],
                'is_favourite': true,
              }
            ])
          }, SetOptions(merge: true));

          isLoading.value = false;
          Get.find<FavouriteController>().fetchFavouriteItems();
          CustomSnackBar.showCustomSnackBar(
            title: 'تمت الاضافة بنجاح',
            message: 'تم اضافة هذا المنتج الى المفضلات ❤️',
          );
        } else {
          CustomSnackBar.showCustomErrorSnackBar(
            title: 'المنتج غير موجود',
            message:
                'عذرًا، المنتج الذي تحاول اضافته غير موجود في قاعدة البيانات.',
          );
        }
      } catch (e) {
        CustomSnackBar.showCustomErrorSnackBar(
          title: 'حدث خطأ ما',
          message: 'لم تنجح عملية الاضافة ، يرجى اعادة المحاولة 🙁',
        );
        print('Error: $e');
      }
    } else {
      CustomSnackBar.showCustomErrorSnackBar(
        title: 'حدث خطأ ما',
        message: 'لم تنجح عملية الاضافة ، يرجى اعادة المحاولة 🙁',
      );
    }
  }

  void performFavourite(String tour_name) async {
    setFavouriteTour(tour_name);
    await fetchTour();
    addTourToFavourites();
  }

  @override
  void onInit() {
    getCategoriesList();
    getToursList();
    super.onInit();
  }
}
