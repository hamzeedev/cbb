import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final PageController pageController = PageController();
  RxInt currentPage = 0.obs;

  changePage(int index) {
    currentPage.value = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  onTapAdd() {}
}
