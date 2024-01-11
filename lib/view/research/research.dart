import 'package:cbb/res/colors/AppColors.dart';
import 'package:cbb/view/research/papers/components/upload_paper.dart';
import 'package:cbb/view/research/papers/papers.dart';
import 'package:cbb/view/research/report/report.dart';
import 'package:cbb/view_model/controllers/research_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/components/app_top_header.dart';
import '../home/components/pdf_post.dart';

class Research extends StatelessWidget {
  Research({super.key});
  final controller = Get.put(ResearchController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            AppTopHeader(
              title: 'Projects',
              backOk: false,
              searchContent: controller.searchContent,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 5),
              color: AppColors.primaryColor,
              child: const TabBar(
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.white,
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  padding: EdgeInsets.zero,
                  indicatorColor: AppColors.primaryColor,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: -10),
                  indicator: BoxDecoration(color: AppColors.whiteColor),
                  tabs: [
                    Tab(
                      text: 'Research Papers',
                    ),
                    Tab(
                      text: 'Feasibility Report',
                    )
                  ]),
            ),
            const Expanded(
                child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [Papers(), Reports()]))
          ],
        )),
      ),
    );
  }
}
