import 'package:cbb/view/home/components/app_top_header.dart';
import 'package:cbb/view/home/components/image_post.dart';
import 'package:cbb/view/home/components/video_post.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class Documentary extends StatelessWidget {
  const Documentary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          AppTopHeader(
            title: 'Documentary',
            show: false,
            // widget: const Icon(
            //   Icons.more_vert_outlined,
            //   color: Colors.white,
            // ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FirebaseAnimatedList(query: FirebaseDatabase.instance.ref('cbbPosts'), itemBuilder: (context, snapshot, animation, index) {
                if(snapshot.child('type').value.toString()=='video'){
                  return VideoPost(snapshot: snapshot);
                }
                return Container();
              },)
          ))
        ],
      )),
    );
  }
}
