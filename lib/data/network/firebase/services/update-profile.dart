import 'package:cbb/data/network/firebase/services/upload_file.dart';
import 'package:cbb/utils/utils.dart';
import 'package:cbb/view_model/controllers/user_data.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../view/setting/components/setting_header.dart';

class UpdateProfile {
  static updateProfilePicture(
      {required String image, required String name}) async {
    String url = await UploadFile.uploadFile(
        filePath: image,
        uploadPath:
            '${UserData.uid}/profilePicture/${DateTime.now().microsecondsSinceEpoch}$name');
    FirebaseDatabase.instance
        .ref('Users')
        .child('Clients')
        .child(UserData.uid)
        .update({'profilePicture': url}).then((value) async {
      UserData.profilePicture = url;
      final controller=Get.put(PictureController());
      controller.changePicture(image: url);
      final pref = await SharedPreferences.getInstance();
      pref.setString('profilePicture', url);
      Utils.showSnackBar(
          'Profile Picture',
          'Your profile picture is updated',
          Icon(
            Icons.done_all,
            color: Colors.grey,
          ));
    }).onError((error, stackTrace) {
      Utils.showSnackBar(
          'Profile Picture',
          'Unable to update your picture! try again',
          Icon(
            Icons.warning_amber,
            color: Colors.red,
          ));
    });
  }
}
