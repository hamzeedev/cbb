import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../home/components/app_top_header.dart';
import '../home/components/image_post.dart';

class CbbPosts extends StatelessWidget {
  const CbbPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          AppTopHeader(title: 'Posts',
            show: false,
            widget: Icon(Icons.more_vert_outlined,color: Colors.white,),
          ),
          SizedBox(height: 20,),
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: FirebaseAnimatedList(query: FirebaseDatabase.instance.ref('cbbPosts'), itemBuilder: (context, snapshot, animation, index) {
              if(snapshot.child('type').value.toString()=='image'){
                return ImagePost(snapshot: snapshot);
              }
              return Container();
            },)
          ))
        ],
      )),
    );
  }
}
