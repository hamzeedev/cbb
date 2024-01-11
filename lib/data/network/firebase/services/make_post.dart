import 'package:cbb/utils/utils.dart';
import 'package:cbb/view_model/controllers/user_data.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MakePost {
  static upload({
    required String url,
    required String title,
    required String description,
    required String fileName,
    required String type,
    required String refType,
    required String size,
    required String postType,
  }) async{
    final String key=DateTime.now().microsecondsSinceEpoch.toString();

    Map<String,dynamic> userInfo={
      'userName' : UserData.userName,
      'profilePicture' : UserData.profilePicture,
      'postDate' : Utils.getCurrentDate(),
      'senderUID' : UserData.uid

    };

    Map<String,dynamic> postData={
      'id' : key,
      'url' : url,
      'date' : Utils.getCurrentDate(),
      'time' : Utils.getCurrentTime(),
      'title' : title,
      'description' : description,
      'type' :type,
      'size' : size,
      'fileName' : fileName,
      'sender' : userInfo,
      'postType' : postType,

    };
    final ref=FirebaseDatabase.instance.ref('requests')
    .child(key);
    ref.set(postData).then((value){
      Utils.showSnackBar('Post Upload', 'Your content is successfully uploaded', Icon(Icons.done_all));
    }).onError((error, stackTrace){
      Utils.showSnackBar('Error', 'Can\'t upload your post!try again',
          Icon(Icons.warning_amber,color: Colors.red,));
    });
    FirebaseDatabase.instance.ref('Users').child('Clients')
    .child(UserData.uid).child('posts').child(key).set(postData);
  }
}
