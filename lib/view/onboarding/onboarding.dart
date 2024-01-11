import 'package:cbb/res/assets/app_images.dart';
import 'package:cbb/res/colors/AppColors.dart';
import 'package:cbb/res/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/account_btn.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
              child: Image.asset(
            AppImages.splashImage,
          )),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Welcome To',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35),
          ),
          const Text(
            'COMSIAN BizBuzz!',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w100, fontSize: 35),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AccountBtn(
                outline: true,
                txt: 'Sign up',
                  onTap: ()=>Get.toNamed(RoutesNames.register)
              ),
              AccountBtn(
                txt: 'Sign in',
                onTap: ()=>Get.toNamed(RoutesNames.login),
                color: Colors.white,
                textColor: AppColors.primaryColor,
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}


