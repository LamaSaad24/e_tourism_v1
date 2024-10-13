 import 'dart:convert';
  import 'package:get/get.dart';
  import 'package:http/http.dart' as http;
  import 'package:logger/logger.dart';

  class DetailsTourController extends GetxController {
    RxBool isLoading = false.obs;
    Map<String, dynamic> tour = Map<String, dynamic>();


    var tourId = ''.obs;

    void setTourId(String id) {
      tourId.value = id;
      getTourData();
      // print(id);
    }


    Future<void> getTourData() async {
      isLoading.value = true;
      try {
        var apiKey = "02e52c269a76ea64d636e0399c085eb1";
        var url = "https://api.themoviedb.org/3/movie/${tourId}?language=en-US&api_key=${apiKey}";

        var response = await http.get(Uri.parse(url));

        var data =  jsonDecode(response.body);
        print(url);
        // print(data.runtimeType);
        // print(data);
        tour.assignAll(data);
        print(tour['title']);

      } catch (e) {
        Logger().e(e.toString());
      } finally {
        isLoading.value = false;
      }
    }


    List<dynamic> drivers = [
      {'id':1,
      'name':'exam'},
      {'id':2,
        'name':'test'},
      {'id':3,
        'name':'do'}
    ];

    // جلب بيانات السائقين من API
    Future<void> fetchDrivers() async {
      var url = "https://api.example.com/drivers";  // استبدل الرابط برابط API الخاص بك
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
          drivers.assignAll(data);  // قم بتعيين البيانات المستلمة من API
      } else {
        print('Failed to load drivers');
      }
    }

    void updateTour(Map<String, dynamic> tour) async{
      print("tour is");
      print(tour);
      final res = await http.put(
          Uri.parse('https://jsonplaceholder.typicode.com/albums/${tour['id']}'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'title': tour['title'],
            'body': tour['body']
          }),
        );
      print('response:');
      print(res);

    }


    @override
    void onInit() {

      super.onInit();
      // fetchDrivers();
    }
  }