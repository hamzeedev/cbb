import 'package:cbb/res/colors/AppColors.dart';
import 'package:cbb/res/routes/routes_names.dart';
import 'package:cbb/view/setting/components/setting_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SettingHeader(),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Account',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        SettingRow(
                            title: 'Security',
                            prefix: Icons.security,
                            onTap: () => Get.toNamed(RoutesNames.security),
                            postFix: const Icon(Icons.navigate_next_sharp)),
                        const SizedBox(
                          height: 20,
                        ),
                        SettingRow(
                          title: 'Notification',
                          onTap: () => Get.toNamed(RoutesNames.notification),
                          prefix: Icons.notifications_none,
                          postFix: Switch(
                            trackOutlineColor: const MaterialStatePropertyAll(
                                Colors.transparent),
                            inactiveTrackColor: Colors.grey.withOpacity(.4),
                            activeColor: AppColors.whiteColor,
                            activeTrackColor: AppColors.primaryColor,
                            value: true,
                            onChanged: (bool value) {},
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SettingRow(
                            title: 'Privacy Policy',
                            prefix: Icons.lock_outlined,
                            onTap: () => Get.toNamed(RoutesNames.privacyPolicy),
                            postFix: const Icon(Icons.navigate_next_sharp)),
                        const SizedBox(
                          height: 20,
                        ),
                        const SettingRow(
                            title: 'Bookmarks',
                            prefix: Icons.bookmark_border,
                            postFix: Icon(Icons.navigate_next_sharp)),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Support & About',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: SettingRow(
                      title: 'Help & Support',
                      prefix: Icons.help_outline_rounded,
                      onTap: () => Get.toNamed(RoutesNames.helpSupport),
                      postFix: const Icon(Icons.navigate_next_sharp),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Chache',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: SettingRow(
                      title: 'Free up space',
                      prefix: Icons.delete_outline_sharp,
                      onTap: () => Get.toNamed(RoutesNames.cachedView),
                      postFix: const Icon(Icons.navigate_next_sharp),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class SettingRow extends StatelessWidget {
  const SettingRow(
      {super.key,
      required this.title,
      required this.prefix,
      required this.postFix,
      this.onTap});
  final String title;
  final IconData prefix;
  final Widget postFix;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            prefix,
            color: Colors.black87,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            title,
            style: const TextStyle(
                color: Colors.black87, fontWeight: FontWeight.w400),
          ),
          const Spacer(),
          postFix
        ],
      ),
    );
  }
}
