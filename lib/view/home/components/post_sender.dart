import 'package:cached_network_image/cached_network_image.dart';
import 'package:cbb/data/network/firebase/services/post_actions.dart';
import 'package:cbb/view/make_comments/make_comments.dart';
import 'package:cbb/view_model/controllers/user_data.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostSender extends StatelessWidget {
  const PostSender(
      {super.key,
        required this.image,
        required this.name,
        required this.postDate,
        required this.senderUID, required this.snapshot});
  final String image;
  final String name;
  final String postDate;
  final String senderUID;
  final DataSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImage(
          imageUrl: image,
          imageBuilder: (context, imageProvider) {
            return CircleAvatar(
              radius: 23,
              backgroundImage: imageProvider,
            );
          },
          errorWidget: (context, url, error) {
            return CircleAvatar(
              radius: 23,
              backgroundColor: Colors.grey.withOpacity(.2),
              child: const Center(
                child: const Icon(
                  Icons.person
                ),
              ),
            );
          },
          placeholder: (context, url) {
            return const CircularProgressIndicator(
              color: Colors.blue,
              strokeWidth: 0.5,
            );
          },
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              postDate,
              style: const TextStyle(color: Colors.black54, fontSize: 12),
            )
          ],
        ),
        const Spacer(),
        Row(
          children: [
            GestureDetector(
              onTap: () => PostActions.likePost(snapshot),
              child:  Icon(
                UserData.likedPosts.contains(
                  snapshot.child('id').value.toString()
                )?
                Icons.favorite : Icons.favorite_border,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () => Get.to(()=>MakeComments(snapshot: snapshot)),
              child: const Icon(
                Icons.mode_comment_outlined,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () => PostActions.bookMark(snapshot),
              child:  Icon(
                UserData.bookMarks.contains(
                    snapshot.child('id').value.toString()
                )?
                Icons.bookmark : Icons.bookmark_border,
                color: Colors.grey,
                size: 26,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () => PostActions.share(snapshot),
              child: const Icon(
                Icons.share,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        )
      ],
    );
  }
}