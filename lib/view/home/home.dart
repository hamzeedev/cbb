import 'package:cbb/view/drawer/drawer.dart';
import 'package:cbb/view/home/components/app_top_header.dart';
import 'package:cbb/view_model/controllers/home_controller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/image_post.dart';
import 'components/pdf_post.dart';
import 'components/video_post.dart';

class HomeView extends StatelessWidget {
  
  final String title;
  HomeView({super.key, required this.title,  });
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  MyDrawer(),
      body: SafeArea(
          child: Column(
        children: [
          AppTopHeader(
            title: title,
            showBackButton: false,
            
            searchContent: controller.searchContent,
          ),
          Expanded(
              child: FirebaseAnimatedList(
            query: FirebaseDatabase.instance.ref('posts'),
            itemBuilder: (context, snapshot, animation, index) {
              if (snapshot.child('type').value.toString() == 'image') {
                return Column(
                  children: [
                    if (index == 0)
                      const SizedBox(
                        height: 20,
                      ),
                    ImagePost(
                      snapshot: snapshot,
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                );
              } else if (snapshot.child('type').value.toString() == 'video') {
                return Column(
                  children: [
                    if (index == 0)
                      const SizedBox(
                        height: 20,
                      ),
                    VideoPost(
                      snapshot: snapshot,
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                );
              } else if (snapshot.child('type').value.toString() == 'pdf') {
                return Column(
                  children: [
                    if (index == 0)
                      const SizedBox(
                        height: 20,
                      ),
                    PdfPost(
                      snapshot: snapshot,
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                );
              }
              return Container();
            },
          ))
        ],
      )),
    );
  }
}
