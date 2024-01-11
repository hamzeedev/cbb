import 'package:cbb/utils/utils.dart';
import 'package:cbb/view_model/controllers/user_data.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class PostActions {
  static Future<void> likePost(DataSnapshot snapshot) async {
    String postId = snapshot
        .child('id')
        .value
        .toString();
    String senderUID = snapshot
        .child('sender')
        .child('senderUID')
        .value
        .toString();
    Map<String, dynamic> likeData = {
      'userName': UserData.userName,
      'profilePicture': UserData.profilePicture,
      'uid': UserData.uid,
    };
    DatabaseReference userClientsRef = FirebaseDatabase.instance.ref('Users')
        .child('Clients');
    DatabaseReference postRef = snapshot.ref.child(postId);
    if (!UserData.likedPosts.contains(postId)) {
       postRef.child('likes').child(UserData.uid).set(likeData);
       userClientsRef.child(UserData.uid).child('likedPosts')
          .child(postId)
          .set(snapshot.value);
       userClientsRef.child(senderUID).child('posts').child(postId).child(
          'likes').child(UserData.uid).set(likeData);
      UserData.likedPosts.add(postId);
    } else {
      await postRef.child('likes').child(UserData.uid).remove();
       userClientsRef.child(UserData.uid).child('likedPosts')
          .child(postId)
          .remove();
       userClientsRef.child(senderUID).child('posts').child(postId).child(
          'likes').child(UserData.uid).remove();
      UserData.likedPosts.remove(postId);
    }
    final String tempKey = DateTime
        .now()
        .microsecondsSinceEpoch
        .toString();
    snapshot.ref.child(tempKey).set({
      'h' : 'h'
    });
    snapshot.ref.child(tempKey).remove();
  }
  static share(DataSnapshot snapshot) {
    Get.bottomSheet(
        isScrollControlled: false,
        isDismissible: true,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        Container(
          height: 100,
          width: MediaQuery
              .sizeOf(Get.context!)
              .width,
          decoration: const BoxDecoration(color: Colors.transparent),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap: () {
              Get.back();
              // final String key =
              //     DateTime.now().microsecondsSinceEpoch.toString();
              // FirebaseDatabase.instance
              //     .ref('Users')
              //     .child('Clients')
              //     .child(UserInfo.uid)
              //     .child('posts')
              //     .child(key)
              //     .set(snapshot.value);
              // FirebaseDatabase.instance
              //     .ref('Users')
              //     .child('Clients')
              //     .child(UserInfo.uid)
              //     .child('posts')
              //     .child(key)
              //     .update({'id': key});
              // FirebaseDatabase.instance
              //     .ref('Users')
              //     .child('Clients')
              //     .child(UserInfo.uid)
              //     .child('posts')
              //     .child(key)
              //     .child('likedPosts')
              //     .remove();
              // FirebaseDatabase.instance
              //     .ref('Users')
              //     .child('Clients')
              //     .child(UserInfo.uid)
              //     .child('posts')
              //     .child(key)
              //     .child('comments')
              //     .remove();
              // FirebaseDatabase.instance
              //     .ref(snapshot.child('postType').value.toString())
              //     .child(key)
              //     .set(snapshot.value);
              // FirebaseDatabase.instance
              //     .ref(snapshot.child('postType').value.toString())
              //     .child(key)
              //     .update({'id': key});
              // FirebaseDatabase.instance
              //     .ref(snapshot.child('postType').value.toString())
              //     .child(key)
              //     .child('likedPosts')
              //     .remove();
              // FirebaseDatabase.instance
              //     .ref(snapshot.child('postType').value.toString())
              //     .child(key)
              //     .child('comments')
              //     .remove();

              final String uid = UserData.uid;
              final String key = DateTime
                  .now()
                  .microsecondsSinceEpoch
                  .toString();
              final DatabaseReference userPostsRef = FirebaseDatabase.instance
                  .ref('Users/Clients/$uid/posts/$key');
              final DatabaseReference postTypeRef = FirebaseDatabase.instance
                  .ref(snapshot
                  .child('postType')
                  .value
                  .toString());

              userPostsRef.set(snapshot.value);
              userPostsRef.update({'id': key});
              userPostsRef.child('likedPosts').remove();
              userPostsRef.child('comments').remove();

              postTypeRef.child(key).set(snapshot.value);
              postTypeRef.child(key).update({'id': key});
              postTypeRef.child(key).child('likedPosts').remove();
              postTypeRef.child(key).child('comments').remove();
            },
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.share_rounded,
                  color: Colors.blue,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Share Post',
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Spacer(),
              ],
            ),
          ),
        ));
  }
  static bookMark(DataSnapshot snapshot) {
    if (!(UserData.bookMarks.contains(snapshot
        .child('id')
        .value
        .toString()))) {
      FirebaseDatabase.instance.ref('Users')
          .child('Clients').child(UserData.uid).child('bookmarks')
          .child(snapshot
          .child('id')
          .value
          .toString())
          .set(snapshot.value);
      UserData.bookMarks.add(snapshot
          .child('id')
          .value
          .toString());
    } else {
      FirebaseDatabase.instance.ref('Users')
          .child('Clients').child(UserData.uid).
      child('bookmarks').child(snapshot
          .child('id')
          .value
          .toString()).remove();
      UserData.bookMarks.remove(snapshot
          .child('id')
          .value
          .toString());
    }


    final String tempKey = DateTime
        .now()
        .microsecondsSinceEpoch
        .toString();
    snapshot.ref.child(tempKey).set({
      'h' : 'h'
    });

    snapshot.ref.child(tempKey).remove();



  }

  static comment(DataSnapshot snapshot,
      String comment) async {
    final String key = DateTime
        .now()
        .microsecondsSinceEpoch
        .toString();
    await snapshot.ref.child(snapshot
        .child('id')
        .value
        .toString())
        .child('comments').child(key).set({
      'comment': comment,
      'date': Utils.getCurrentDate(),
      'time': Utils.getCurrentTime(),
      'commenter': {
        'uid': UserData.uid,
        'profilePicture': UserData.profilePicture,
        'userName': UserData.userName,
      }
    });


    await FirebaseDatabase.instance.ref('Users').child('Clients')
        .child(snapshot
        .child('sender')
        .child('senderUID')
        .value
        .toString()).
    child('posts').child(snapshot
        .child('id')
        .value
        .toString())
        .child('comments').child(key).set({
      'comment': comment,
      'date': Utils.getCurrentDate(),
      'time': Utils.getCurrentTime(),
      'commenter': {
        'uid': UserData.uid,
        'profilePicture': UserData.profilePicture,
        'userName': UserData.userName,
      }
    });
  }
}
