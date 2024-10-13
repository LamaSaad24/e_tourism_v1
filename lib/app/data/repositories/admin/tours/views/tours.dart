import 'package:e_tourism/app/data/repositories/admin/tours/controllers/tours.dart';
import 'package:e_tourism/app/data/repositories/admin/tours/views/widgets/DatePickerPage.dart';
import 'package:e_tourism/app/data/repositories/admin/tours/views/widgets/common_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:get/get.dart';

class ToursView extends GetView<ToursController> {
  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(' api الرحلات'),
        backgroundColor: Colors.deepPurple,
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DatePickerPage(),
                ),
              );
            },
            child: Text('إنشاء تقرير',
                style: TextStyle(color: Colors.white, fontSize: 12)),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple, elevation: 0),
          )
        ],
      ),
      sideBar: SideBar(
        items: const [
          AdminMenuItem(
            title: 'الصفحة الرئيسية',
            route: '/home_dash',
            icon: Icons.dashboard,
          ),
          AdminMenuItem(
            title: 'الدليل السياحيين',
            icon: Icons.drive_eta,
            route: '/guides',
          ),
          AdminMenuItem(
            title: 'السائقين ',
            icon: Icons.drive_eta,
            route: '/drivers',
          ),
          AdminMenuItem(
            title: 'البرامج السياحية',
            icon: Icons.add_chart,
            route: '/programmes',
          ),
          AdminMenuItem(
            title: 'الرحلات ',
            icon: Icons.tour,
            route: '/tours',
          ),
          AdminMenuItem(
            title: 'السياح ',
            icon: Icons.people_alt,
            route: '/tourists',
          ),
          AdminMenuItem(
            title: 'تسجيل الدخول ',
            icon: Icons.login,
            route: '/login',
          ),
        ],
        selectedRoute: '/',
        onSelected: (item) {
          if (item.route != null) {
            Navigator.of(context).pushNamed(item.route!);
          }
        },
      ),
      body: (Obx(() {
        return controller.isLoading.value
            ? Center(child: CupertinoActivityIndicator())
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemCount: controller.tours.length,
                itemBuilder: (context, index) {
                  final tour = controller.tours[index];
                  return CommonCard(
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Container(
                              width: 36,
                              height: 36,
                              alignment: Alignment.center,
                              color: Colors.grey.shade200,
                              child: Icon(
                                Icons.tour,
                                color: Colors.purple, // لون الرمز
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            ' ${tour['title']}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '${tour['vote_count']} سائح ',
                                style:
                                    const TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                              Text(
                                '${tour['release_date']}',
                                style:
                                    const TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '${tour['vote_count']} \$',
                                style:
                                    const TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                              // Container(
                              //   height: 36,
                              //   padding: const EdgeInsets.all(8.0),
                              //   alignment: Alignment.center,
                              //   color: (tour['type'].trim() == "بالانتظار")
                              //       ? Colors.yellow
                              //       : (tour['type'].trim() == "مفتوح")
                              //           ? Colors.green
                              //           : (tour['type'].trim() == "مغلق")
                              //               ? Colors.red
                              //               : Colors.grey.shade200,
                              //   child: Text(
                              //     '${tour['type']}',
                              //     style: TextStyle(
                              //         fontSize: 11,
                              //         color: Colors.white,
                              //         fontWeight: FontWeight.bold),
                              //   ),
                              // ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.read_more,
                                      color: Colors.deepPurple),
                                  onPressed: () {
                                    Get.toNamed('/detailsTours',
                                        arguments: {'id': '${tour['id']}'});
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.edit, color: Colors.blue),
                                  onPressed: () {
                                    Get.toNamed('/editTours', arguments: {'id': '${tour['id']}'});
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete,
                                      color: Colors.redAccent),
                                  onPressed: () {
                                    controller.deleteTours(tour['id']);
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
      })),
    );
  }
}
