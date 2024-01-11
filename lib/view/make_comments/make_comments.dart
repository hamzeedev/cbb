import 'package:cached_network_image/cached_network_image.dart';
import 'package:cbb/data/network/firebase/services/post_actions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../home/components/image_post.dart';
import '../home/components/pdf_post.dart';
import '../home/components/video_post.dart';

class MakeComments extends StatelessWidget {
  final DataSnapshot snapshot;
  final TextEditingController comment = TextEditingController();

  MakeComments({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            if (snapshot.child('type').value.toString() == 'image')
              Column(
                children: [
                  ImagePost(
                    snapshot: snapshot,
                    showSender: false,
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            if (snapshot.child('type').value.toString() == 'video')
              Column(
                children: [
                  VideoPost(
                    snapshot: snapshot,
                    showSender: false,
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            if (snapshot.child('type').value.toString() == 'pdf')
              Column(
                children: [
                  PdfPost(
                    snapshot: snapshot,
                    showSender: false,
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Comments',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: FirebaseAnimatedList(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    query: snapshot.ref
                        .child(snapshot.child('id').value.toString())
                        .child('comments'),
                    itemBuilder: (context, snapshot, animation, index) {
                      return SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CachedNetworkImage(
                                imageUrl: snapshot
                                    .child('commenter')
                                    .child('profilePicture')
                                    .value
                                    .toString(),
                                imageBuilder: (context, imageProvider) {
                                  return CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.grey,
                                    backgroundImage: imageProvider,
                                  );
                                },
                                errorWidget: (context, url, error) {
                                  return CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.grey.withOpacity(.1),
                                    child: Center(
                                      child: Icon(
                                        Icons.person,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.sizeOf(context).width-140,
                                    child: Row(
                                      children: [
                                        Text(snapshot
                                            .child('commenter')
                                            .child('userName')
                                            .value
                                            .toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12
                                          ),
                                        ),
                                        Spacer(),
                                        Text(snapshot
                                            .child('date')
                                            .value
                                            .toString(),
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 10
                                          ),
                                        ),
                                        // Spacer(),
                                        // Spacer(),

                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Text(snapshot.child('comment').value.toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12
                                    ),
                                  )
                                ],
                              ))
                            ],
                          ),
                        ),
                      );
                    },
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: comment,
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Write your comment',
                        hintStyle:
                            const TextStyle(color: Colors.grey, fontSize: 13),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              if (comment.value.text.toString().isEmpty) {
                              } else {
                                PostActions.comment(
                                    snapshot, comment.value.text.toString());

                                comment.clear();
                                FocusScope.of(context).unfocus();
                              }
                            },
                            child: const Icon(
                              Icons.send,
                              color: Colors.blue,
                            ))),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

