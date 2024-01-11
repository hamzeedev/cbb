import 'package:cbb/view/authentication/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../view_model/controllers/user_data.dart';

class UserPref {
  static saveUser(Map<String, String> user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('userName', user['userName']!);
    pref.setString('profilePicture', user['profilePicture']!);
    pref.setString('email', user['email']!);
    pref.setString('uid', user['uid']!);
    pref.setString('phoneNumber', user['phoneNumber']!);
    pref.setString('dob', user['dob']!);
    pref.setString('role', user['role']!);
  }

  static Future<Map<String, String?>> getUser() async {
    Map<String, String?> user;
    SharedPreferences pref = await SharedPreferences.getInstance();
    user = {
      'userName': pref.getString('userName'),
      'profilePicture': pref.getString('profilePicture'),
      'email': pref.getString('email'),
      'uid': pref.getString('uid'),
      'phoneNumber': pref.getString('phoneNumber'),
      'dob': pref.getString('dob'),
      'role': pref.getString('role'),
    };
    return user;
  }

  static saveInfo() async {
    Map<String, String?> userData = await UserPref.getUser();
    UserData.uid = userData['uid']!;
    UserData.email = userData['email']!;
    UserData.phoneNumber = userData['phoneNumber']!;
    UserData.role = userData['role']!;
    UserData.userName = userData['userName']!;
    UserData.dob = userData['dob']!;
    UserData.profilePicture = userData['profilePicture']!;
  }

  static logout() async {
    FirebaseAuth.instance.signOut();
    final pref = await SharedPreferences.getInstance();
    pref.clear();
    Get.offAll(() => Login());
  }

  static clearUser() async {
    FirebaseAuth.instance.signOut();
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}
