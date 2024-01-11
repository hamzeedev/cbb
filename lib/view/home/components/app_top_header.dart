import 'package:cbb/view/home/components/search_content_field.dart';
import 'package:cbb/view/navigation/navigation_bar.dart';
import 'package:cbb/view/notifcations/notifications.dart';
import 'package:cbb/view_model/controllers/bottom_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/colors/AppColors.dart';

class AppTopHeader extends StatelessWidget {
  AppTopHeader(
      {super.key,
      required this.title,
      this.searchContent,
      this.widget,
      this.backOk = true,
      this.show = true,
      this.showBackButton = true});

  final String title;
  final TextEditingController? searchContent;
  final Widget? widget;
  final bool show;
  final bool showBackButton;
  final bool backOk;
  final controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195,
      width: MediaQuery.sizeOf(context).width,
      child: Stack(
        children: [
          Container(
            height: 170,
            width: double.infinity,
            color: AppColors.primaryColor,
          ),
          Positioned.fill(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    showBackButton
                        ? GestureDetector(
                            onTap: () {
                              // controller.changePage(0);
                            },
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back_ios),
                              color: Colors.white,
                              onPressed: () {
                                backOk ? Get.back() : controller.changePage(0);
                              },
                              // size: 25,
                            ),
                          )
                        : GestureDetector(
                            onTap: () => Scaffold.of(context).openDrawer(),
                            child: const Icon(
                              Icons.menu,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                    const Spacer(),
                    if (show)
                      IconButton(
                        icon: const Icon(Icons.notifications_active_outlined),
                        color: Colors.white,
                        onPressed: () {
                          Get.to(const NotificationPage());
                        },
                        // size: 25,
                      ),
                    widget ?? const SizedBox()
                  ],
                ),
                const Spacer(),
                Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                const Spacer(),
                SearchContentField(
                    controller: searchContent ?? TextEditingController())
              ],
            ),
          ))
        ],
      ),
    );
  }
}
