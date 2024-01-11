import 'package:cbb/view_model/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../res/assets/app_images.dart';
import '../../../res/colors/AppColors.dart';
import 'components/signup_body.dart';

class Register extends StatelessWidget {
  Register({super.key});
  final controller = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
          child: Stack(
        fit: StackFit.expand,
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                AppImages.signUpTop,
                width: size.width,
                height: size.height / 6.4,
                fit: BoxFit.fill,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height / 7.8,
                ),
                const Text(
                  'Sign up',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 30),
                ),
                Container(
                  height: 2,
                  width: 50,
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            color: AppColors.primaryColor, blurRadius: 1)
                      ]),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(child: SignupBody()
                ),
                const SizedBox(height: 40,)
              ],
            ),
          ),
        ],
      )),
    );
  }
}








