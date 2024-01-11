import 'package:cbb/data/user_prefe/user_pref.dart';
import 'package:cbb/res/routes/routes_names.dart';
import 'package:cbb/view_model/controllers/login_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/utils.dart';
import '../../../../view/authentication/login/login.dart';
import '../../../../view/navigation/navigation_bar.dart';

class LoginAccount {
  loginAccount() {
    final controller = Get.put(LoginController());
    controller.loading.value = true;
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: controller.email.value.text.toString(),
        password: controller.password.value.text.toString()).then((user) {
      FirebaseDatabase.instance.ref('Users').child('Clients')
          .child(user.user!.uid).once().then((event) {
        DataSnapshot snapshot = event.snapshot;
        if (snapshot.exists) {
          if (snapshot
              .child('userStatus')
              .value
              .toString() == 'suspended') {
            Utils.showSnackBar(
                'Error', 'Unable to login because your account is suspended',
                Icon(Icons.warning_amber,color: Colors.red,));
          } else {
            Map<String, String> userData = {
              'userName': snapshot
                  .child('userName')
                  .value
                  .toString(),
              'profilePicture': snapshot
                  .child('profilePicture')
                  .value
                  .toString(),
              'email': snapshot
                  .child('email')
                  .value
                  .toString(),
              'uid': snapshot
                  .child('uid')
                  .value
                  .toString(),
              'phoneNumber': snapshot
                  .child('phoneNumber')
                  .value
                  .toString(),
              'dob': snapshot
                  .child('dob')
                  .value
                  .toString(),
              'role': snapshot
                  .child('role')
                  .value
                  .toString(),
            };
            UserPref.saveUser(userData);
            controller.loading.value = false;
            UserPref.saveUser(userData);
            UserPref.saveInfo();
            Utils.showSnackBar('Success', 'Successfully login',
                const Icon(Icons.done_all, color: Colors.white,));




            FirebaseDatabase.instance
                .ref('Users')
                .child('Clients')
                .child(user.user!.uid)
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








            Get.offAll(() => HomeBottomNavigation());
          }
        } else {
          controller.loading.value = false;
          Utils.showSnackBar('Error', 'Unable to login! Try again',
              const Icon(Icons.warning_amber, color: Colors.red,)
          );
        }
      }).onError((error, stackTrace) {
        controller.loading.value = false;
        Utils.showSnackBar('Error', 'Unable to login! Try again',
            const Icon(Icons.warning_amber, color: Colors.red,)
        );
      });
    }).onError((error, stackTrace) {
      controller.loading.value = false;
      Utils.showSnackBar('Error', error.toString(),
          const Icon(Icons.warning_amber, color: Colors.red,)
      );
    });
  }
}