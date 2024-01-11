import 'package:cbb/data/network/firebase/services/login_account.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  final email=TextEditingController();
  final password=TextEditingController();
  final formKey=GlobalKey<FormState>();
  RxBool loading=false.obs;

  loginAccount(){
    if(formKey.currentState!.validate()){
      LoginAccount().loginAccount();
    }
  }

}