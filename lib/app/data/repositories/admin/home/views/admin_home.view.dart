import 'package:e_tourism/app/data/repositories/admin/home/views/widgets/DashboardCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_tourism/app/data/repositories/admin/home/controllers/admin_home.controller.dart';

import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class AdminHomeView extends GetView<AdminHomeController> {
  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('لوحة التحكم'),
        backgroundColor: Colors.deepPurple,
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
            icon: Icons.accessibility,
            route: '/guides',
          ),
          AdminMenuItem(
            title: 'السائقين ',
            icon: Icons.car_rental_sharp,
            route: '/drivers',
          ),
          AdminMenuItem(
            title: 'البرامج السياحية',
            icon: Icons.add_chart,
            route: '/programmes',
          ),
          AdminMenuItem(
            title: 'الرحلات ',
            icon: Icons.account_tree_outlined,
            route: '/tours',
          ),
          AdminMenuItem(
            title: 'السياح ',
            icon: Icons.accessibility,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'الصفحة الرئيسية',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                ),
              ),
              SizedBox(height: 20),
                  GridView.count(
                    crossAxisCount: 2, // عدد الأعمدة
                    crossAxisSpacing: 10, // المسافة بين الأعمدة
                    mainAxisSpacing: 10, // المسافة بين الصفوف
                    shrinkWrap: true, // يتناسب مع محتوى الشاشة ولا يحتاج إلى التمرير
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, '/guides'); // تأكد من تعريف المسار '/guides'
                      },
                      child: DashboardCard(
                        icon: Icons.people,
                        color: Colors.amber,
                        label: "الدليل السياحي",
                        value: 30,
                        route: '/guides',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context,
                            '/drivers'); // تأكد من تعريف المسار '/guides'
                      },
                      child: DashboardCard(
                        icon: Icons.car_rental_sharp,
                        color: Colors.deepOrangeAccent,
                        label: "السائقيين",
                        value: 30,
                        route: '/drivers',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context,
                            '/programmes'); // تأكد من تعريف المسار '/guides'
                      },
                      child: DashboardCard(
                        icon: Icons.add_chart,
                        color: Colors.lightBlueAccent,
                        label: "البرامج السياحية",
                        value: 30,
                        route: '/programmes',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, '/tours'); // تأكد من تعريف المسار '/guides'
                      },
                      child: DashboardCard(
                        icon: Icons.account_tree_outlined,
                        color: Colors.lightGreen,
                        label: "الرحلات",
                        value: 343,
                        route: '/tours',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context,
                            '/tourists'); // تأكد من تعريف المسار '/guides'
                      },
                      child: DashboardCard(
                        icon: Icons.accessibility,
                        color: Colors.greenAccent,
                        label: "السياح",
                        value: 343,
                        route: '/tourists',
                      ),
                    ),
                  ],
                                ),
            ],//children
          ),
        ),
      ),
    );
  }
}
