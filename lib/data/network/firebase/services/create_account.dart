import 'package:cbb/data/network/firebase/base_firebase.dart';
import 'package:cbb/data/user_prefe/user_pref.dart';
import 'package:cbb/utils/utils.dart';
import 'package:cbb/view/navigation/navigation_bar.dart';
import 'package:cbb/view_model/controllers/signup_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../../../res/routes/routes_names.dart';
import '../../../../view/authentication/login/login.dart';

class CreateAccount extends FirebaseServices {
  createAccount() {
    final controller = Get.put(RegisterController());
    controller.loading.value = true;
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: controller.email.value.text.toString(),
            password: controller.password.value.text.toString())
        .then((user) {
      Map<String, String> userData = {
        'userName': controller.userName.value.text.toString(),
        'role': controller.roleModel.value.role.toString(),
        'email': controller.email.value.text.toString(),
        'phoneNumber': controller.phoneNumber.value.text.toString(),
        'dob':
            '${controller.dd.value.text}/${controller.mm.value.text}/${controller.yyyy.value.text}',
        'uid': user.user!.uid,
        'profilePicture': 'null',
        'userStatus': 'active'
      };
      FirebaseDatabase.instance
          .ref('Users')
          .child('Clients')
          .child(user.user!.uid)
          .set(userData)
          .then((value) async {
        controller.loading.value = false;
        UserPref.saveUser(userData);


        UserPref.saveInfo();




        Utils.showSnackBar(
            'Success',
            'Account is successfully created',
            const Icon(
              Icons.done_all,
              color: Colors.white,
            ));

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
                  title: const Text('Account Suspended'),
                  content: const Text('Your Account is suspended!'),
                  actions: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const Text(
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
      }).onError((error, stackTrace) {
        Utils.showSnackBar(
            'Error',
            error.toString(),
            const Icon(
              Icons.warning_amber,
              color: Colors.red,
            ));
      });
    }).onError((error, stackTrace) {
      controller.loading.value = false;
      Utils.showSnackBar(
          'Error',
          error.toString(),
          const Icon(
            Icons.warning_amber,
            color: Colors.red,
          ));
    });
  }
}
