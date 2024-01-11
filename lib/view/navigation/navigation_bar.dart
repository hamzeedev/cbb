import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:cbb/view/cbb/cbb.dart';
import 'package:cbb/view/drawer/drawer.dart';
import 'package:cbb/view/home/home.dart';
import 'package:cbb/view/linkedUp/linkedup.dart';
import 'package:cbb/view/make_post/make_post.dart';
import 'package:cbb/view/research/research.dart';
import 'package:cbb/view_model/controllers/bottom_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBottomNavigation extends StatelessWidget {
  HomeBottomNavigation({super.key});
  final controller = Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  MyDrawer(),
      floatingActionButton: GestureDetector(
        onTap: () => MakePost().showPostSheet(),
        child: Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey, width: 2),
              shape: BoxShape.circle),
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => AnimatedBottomNavigationBar(
            icons: const [
              Icons.home_filled,
              Icons.search,
              Icons.workspace_premium,
              Icons.cloud_circle_rounded
            ],
            activeColor: Colors.blue,
            inactiveColor: Colors.black87,
            activeIndex: controller.currentPage.value,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.verySmoothEdge,
            leftCornerRadius: 32,
            rightCornerRadius: 32,
            onTap: (index) => controller.changePage(index)),
      ),
      body: SafeArea(
        child: PageView(
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            HomeView(title: "CBB Home"),
            Research(),
            LinkedUpPage(),
            const CBBSection(),
          ],
        ),
      ),
    );
  }
}
