import 'package:cbb/data/network/firebase/base_firebase.dart';
import 'package:cbb/data/network/firebase/services/create_account.dart';
import 'package:cbb/view/authentication/register/components/signup_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';

class RegisterController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  // final role = TextEditingController();
  final userName = TextEditingController();
  final confirmPassword = TextEditingController();
  final dd = TextEditingController();
  final mm = TextEditingController();
  final yyyy = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxBool isChecked = false.obs;
  RxBool loading = false.obs;
  // RxString selectedRole = ''.obs;
  var roleModel = RoleModel().obs;
  void setRole(String newRole) {
    roleModel.update((val) {
      val!.role = newRole;
    });
    print(roleModel.value.role);
  }

  createAccount() {
    if (formKey.currentState!.validate()) {

      // if(role.value.text.toString().isEmpty){
      //   Utils.showSnackBar(
      //       'Warning',
      //       'Please select your role',
      //       const Icon(
      //         Icons.warning_amber,
      //         color: Colors.red,
      //       ));
      //   return;
      // }

      if (isChecked.value) {
        CreateAccount().createAccount();
      } else {
        Utils.showSnackBar(
            'Warning',
            'Please accept terms and services',
            const Icon(
              Icons.warning_amber,
              color: Colors.red,
            ));
      }
    }
  }
}
