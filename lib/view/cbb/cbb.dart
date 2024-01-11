import 'package:cbb/res/assets/app_images.dart';
import 'package:cbb/res/routes/routes_names.dart';
import 'package:cbb/view/cbb/noticeBoard/notice_board.dart';
import 'package:cbb/view/home/components/app_top_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/cbb_btn.dart';
import 'components/cbb_image.dart';

class CBBSection extends StatelessWidget {
  const CBBSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTopHeader(
            backOk: false,
            title: 'CBB Section',
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CbbBtn(
                iconData: Icons.videocam_rounded,
                data: 'Documentary',
                onTap: () => Get.toNamed(RoutesNames.cbbDocumentary),
              ),
              CbbBtn(
                iconData: Icons.chrome_reader_mode_outlined,
                data: 'Reports',
                onTap: () => Get.toNamed(RoutesNames.cbbReports),
              ),
              CbbBtn(
                iconData: Icons.image,
                data: 'Posts',
                onTap: () => Get.toNamed(RoutesNames.cbbPosts),
              ),
              CbbBtn(
                  iconData: Icons.pages,
                  data: 'Notice Board',
                  onTap: () => Get.to(const NoticeBoard())),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Recents',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Column(
                children: [
                  CbbSectionImage(
                    title: 'Documentary',
                    image: AppImages.documentary,
                    onTap: () => Get.toNamed(RoutesNames.cbbDocumentary),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CbbSectionImage(
                    title: 'Feasibility Reports',
                    image: AppImages.pdfs,
                    onTap: () => Get.toNamed(RoutesNames.cbbReports),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CbbSectionImage(
                    title: 'Posts',
                    image: AppImages.posts,
                    onTap: () => Get.toNamed(RoutesNames.cbbPosts),
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ))
        ],
      )),
    );
  }
}
