import 'package:cbb/view/research/report/upload_your_report.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../../home/components/pdf_post.dart';
import '../papers/components/upload_paper.dart';


class Reports extends StatelessWidget {
  const Reports({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned.fill(child: FirebaseAnimatedList(
            query: FirebaseDatabase.instance.ref('reports'),
            itemBuilder: (context, snapshot, animation, index) {
              print(snapshot.children.length);
              return Column(
                children: [
                  if(index==0) SizedBox(height: 20,),
                  PdfPost(snapshot: snapshot),
                  SizedBox(height: 20,),

                ],
              );
            },)),
        UploadYourReport(title: 'Submit a Feasibility Report'
          ,type: 'research paper',
        )
      ],
    );
  }
}