import 'dart:async';

import 'package:cbb/data/user_prefe/user_pref.dart';
import 'package:cbb/res/routes/routes_names.dart';
import 'package:cbb/view/authentication/login/login.dart';
import 'package:cbb/view_model/controllers/user_data.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view/navigation/navigation_bar.dart';

class SplashServices {
  isLogin() async {
    final uid = (await UserPref.getUser())['uid'];

    if (uid != null) {
      final listner = FirebaseDatabase.instance
          .ref('Users')
          .child('Clients')
          .child(uid)
          .onValue
          .listen((event) {
        if (event.snapshot.child('userStatus').value.toString() ==
            'suspended') {
          UserPref.clearUser();
          Get.offAll(() => Login());
          showGeneralDialog(
            context: Get.context!,
            pageBuilder: (context, animation, secondaryAnimation) {
              return AlertDialog(
                title: Text('Account Suspended'),
                content: Text('Your Account is suspended!'),
                actions: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Text(
                      'OK',
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              );
            },
          );
        }
      });
      FirebaseDatabase.instance
          .ref('Users')
          .child('Clients')
          .child(uid)
          .once()
          .then((value) {
        if (value.snapshot.child('userStatus').value.toString() ==
            'suspended') {
          listner.cancel();
          UserPref.clearUser();
          Get.offAll(() => Login());
          showGeneralDialog(
            context: Get.context!,
            pageBuilder: (context, animation, secondaryAnimation) {
              return AlertDialog(
                title: Text('Account Suspended'),
                content: Text('Your Account is suspended!'),
                actions: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Text(
                      'OK',
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              );
            },
          );
        }
      });
    }
    Timer(const Duration(seconds: 5), () async {
      if (uid == null) {
        Get.offNamed(RoutesNames.onBoarding);
      } else {
        Map<String, String?> userData = await UserPref.getUser();
        UserData.uid = userData['uid']!;
        UserData.email = userData['email']!;
        UserData.phoneNumber = userData['phoneNumber']!;
        UserData.role = userData['role']!;
        UserData.userName = userData['userName']!;
        UserData.dob = userData['dob']!;
        UserData.profilePicture = userData['profilePicture']!;
        FirebaseDatabase.instance
            .ref('Users')
            .child('Clients')
            .child(uid)
            .child('likedPosts')
            .once()
            .then((event) {
          DataSnapshot snapshot = event.snapshot;
          snapshot.children.forEach((e) {
            UserData.likedPosts.add(e.child('id').value.toString());
          });
        });

        FirebaseDatabase.instance
            .ref('Users')
            .child('Clients')
            .child(uid)
            .child('bookmarks')
            .once()
            .then((event) {
          DataSnapshot snapshot = event.snapshot;
          snapshot.children.forEach((e) {
            UserData.likedPosts.add(e.child('id').value.toString());
          });
        });

        Get.offAll(() => HomeBottomNavigation());
      }
    });
  }
}
