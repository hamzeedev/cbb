import 'package:cbb/view/home/components/pdf_viwer.dart';
import 'package:cbb/view/home/components/post_sender.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/assets/app_icons.dart';

class PdfPost extends StatelessWidget {
  const PdfPost({super.key, required this.snapshot,
     this.showSender=true});
  final DataSnapshot snapshot;
  final bool showSender;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.white,
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 140,
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(
                color: Colors.white
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => Get.to( PDFViewerView(
                      url: snapshot.child('url').value.toString())),
                  child: Row(
                    children: [
                      const SizedBox(width: 10,),
                      Image.asset(AppIcon.pdf,height: 60,),
                      const SizedBox(width: 20,),
                       Text(snapshot.child('fileName').value.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                      Spacer(),
                      Text(snapshot.child('size').value.toString(),
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(width: 20,),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 5,
                ),
                Divider(),
                if(showSender) SizedBox(height: 10,),
                if(showSender) Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: PostSender(
                    snapshot: snapshot,
                      image: snapshot
                          .child('sender')
                          .child('profilePicture')
                          .value
                          .toString(),
                      name: snapshot
                          .child('sender')
                          .child('userName')
                          .value
                          .toString(),
                      postDate: snapshot
                          .child('sender')
                          .child('postDate')
                          .value
                          .toString(),
                      senderUID: snapshot
                          .child('sender')
                          .child('senderUID')
                          .value
                          .toString()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}