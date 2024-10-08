import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchByDaterPage extends StatelessWidget {
  final String selectedDate;
  final String selectedRange;
  // final List<Map<String, dynamic>> toursList;

  SearchByDaterPage({
    required this.selectedDate,
    required this.selectedRange,
    // required this.toursList, // تمرير قائمة الرحلات من الصفحة السابقة أو من التحكم
  });
  //كود مؤقت لعرض داتا مبدأية
  final RxList<dynamic> toursList = [
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('نتائج البحث للرحلات'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'التواريخ المختارة: $selectedRange',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: toursList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // الانتقال إلى صفحة تفاصيل الرحلة عند النقر
                    Get.toNamed(
                      '/tour-details', // قم بتحديد مسار الصفحة المناسبة
                      arguments: toursList[index]['title'], // تمرير بيانات الرحلة
                    );
                  },
                  child: Card(
                    elevation: 4,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Stack(
                      children: [
                        // صورة الرحلة
                        Image.asset(
                          toursList[index]['image'], // تأكد من توفير المسار الصحيح للصورة
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200, // يمكنك تغيير الارتفاع حسب رغبتك
                        ),
                        // أيقونة المفضلة
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white30,
                            ),
                            child: InkWell(
                              onTap: () {
                                // تنفيذ عملية إضافة إلى المفضلة
                                // هنا يمكنك استدعاء التحكم لإضافة الرحلة إلى المفضلة
                              },
                              child: Icon(
                                toursList[index]['is_favourite'] == true
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ),
                        // معلومات الرحلة: العنوان والسعر
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              color: Colors.black54, // خلفية نصف شفافة
                              child: Center(
                                child: Text(
                                  toursList[index]['title'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              color: Colors.black54, // خلفية نصف شفافة
                              child: Text(
                                toursList[index]["price"].toString() + "\$",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
