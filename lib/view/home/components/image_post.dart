import 'package:cached_network_image/cached_network_image.dart';
import 'package:cbb/view/home/components/post_sender.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ImagePost extends StatelessWidget {
  const ImagePost({super.key, required this.snapshot,
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
            height: 250,
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Expanded(
                    child: CachedNetworkImage(
                  imageUrl: snapshot.child('url').value.toString(),
                  placeholder: (context, url) {
                    return Center(
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(
                          color: Colors.grey,
                          strokeWidth: 0.5,
                        ),
                      ),
                    );
                  },
                  imageBuilder: (context, imageProvider) {
                    return Image(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    );
                  },
                )),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    snapshot.child('title').value.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                if(showSender)  SizedBox(
                  height: 10,
                ),
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
