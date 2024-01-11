import 'package:cbb/utils/utils.dart';
import 'package:cbb/view_model/controllers/job-post-controller.dart';
import 'package:cbb/view_model/controllers/user_data.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadJob{
  static upload() async {
    final controller=Get.put(JobPostController());
    controller.loading.value=true;
    final key=DateTime.now().microsecondsSinceEpoch.toString();

   try{
     await FirebaseDatabase.instance.ref('jobs').child(key).set({
       'key' : key,
       'jobTitle' : controller.title.value.text.toString(),
       'jobDescription' : controller.title.value.text.toString(),
       'jobType' : controller.type.value.toString(),
       'uploadDate' : Utils.getCurrentDate(),
       'sender' : {
         'senderUID' : UserData.uid,
         'senderRole' : UserData.role,
         'senderName' : UserData.userName,
         'senderPicture' : UserData.profilePicture,
         'senderEmail' : UserData.email,
       }
     });
     await FirebaseDatabase.instance.ref('Users').child('Clients').child(UserData.uid).child('jobs').child(key).set({
       'key' : key,
       'jobTitle' : controller.title.value.text.toString(),
       'jobDescription' : controller.title.value.text.toString(),
       'jobType' : controller.type.value.toString(),
       'uploadDate' : Utils.getCurrentDate(),
       'sender' : {
         'senderUID' : UserData.uid,
         'senderRole' : UserData.role,
         'senderName' : UserData.userName,
         'senderPicture' : UserData.profilePicture,
         'senderEmail' : UserData.email,
       }
     });
     controller.loading.value=false;
     Get.back();
     Utils.showSnackBar('Success', 'Successfully Posted Job', Icon(Icons.done_all,color: Colors.white,));


   }catch(e){
     controller.loading.value=false;
     Utils.showSnackBar('Warning', 'Something went wrong! try again', Icon(Icons.done_all,color: Colors.white,));

   }


  }
}