import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class ToursController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<dynamic> tours = [].obs;


  Future<RxList> getToursList() async {
    isLoading.value = true;
    try {
      var apiKey = "02e52c269a76ea64d636e0399c085eb1";
      var url = "https://api.themoviedb.org/3/movie/popular?api_key=${apiKey}";
      var res = await  get(Uri.parse(url));
      var data = jsonDecode(res.body);
      // print(data);
      tours.addAll(data['results']);
      isLoading.value = false;
    } catch (e) {
      Logger().e(e);
    }
    return tours;
  }

  // دالة حذف المرشد
  void deleteTours(int id) async {
    final response = await delete(
        Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),
        headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        },);

    tours.removeWhere((tour) => tour['id'] == id);
  }

  // دالة تحديث المرشد
  void updateTour(Map<String, dynamic> updatedTours) {
    int index = tours.indexWhere((tour) => tour['id'] == updatedTours['id']);
    if (index != -1) {
      tours[index] = updatedTours;
    }
  }

  @override
  void onInit() {
    getToursList();
    super.onInit();
  }
}
