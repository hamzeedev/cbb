import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../../home/components/pdf_post.dart';
import 'components/upload_paper.dart';

class Papers extends StatelessWidget {
  const Papers({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned.fill(child: FirebaseAnimatedList(
          query: FirebaseDatabase.instance.ref('papers'),
          itemBuilder: (context, snapshot, animation, index) {
            return Column(
              children: [
                if(index==0) SizedBox(height: 20,),
                PdfPost(snapshot: snapshot),
                SizedBox(height: 20,),
              ],
            );
          },)),
        UploadYourPaper(title: 'Submit a research Paper'
          ,type: 'research paper',
        )
      ],
    );
  }
}
