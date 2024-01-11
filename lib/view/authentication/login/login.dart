import 'package:cbb/res/assets/app_images.dart';
import 'package:cbb/res/colors/AppColors.dart';
import 'package:cbb/res/routes/routes_names.dart';
import 'package:cbb/view/onboarding/components/account_btn.dart';
import 'package:cbb/view_model/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';
import 'components/account_field.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final controller = Get.put(LoginController());
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
                AppImages.loginInTop,
                width: size.width,
                height: size.height / 2.4,
                fit: BoxFit.fill,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height / 2.8,
                  ),
                  const Text(
                    'Sign in',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 30),
                  ),
                  Container(
                    height: 2,
                    width: 70,
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
                    height: 50,
                  ),
                  Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          AccountTextFields(
                            controller: controller.email,
                            hint: 'abc@gmail.com',
                            title: 'Email',
                            validator: (p0) {
                              if (p0 == null) {
                                return 'Please enter valid email';
                              } else if (!EmailValidator.validate(p0)) {
                                return 'Please enter valid email';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          AccountTextFields(
                            controller: controller.password,
                            hint: 'Enter your password',
                            title: 'Password',
                            validator: (p0) {
                              if (p0 == null) {
                                return 'Invalid password';
                              } else if (p0.length < 6) {
                                return 'Invalid password';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Obx(() => AccountBtn(
                        height: 40,
                        width: size.width,
                        color: Colors.blue,
                        loading: controller.loading.value,
                        txt: 'Sign In',
                        onTap: () => controller.loginAccount(),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'or',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () => Get.offNamed(RoutesNames.register),
                    child: const Text.rich(TextSpan(children: [
                      TextSpan(
                        text: 'Click to ',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                          text: 'Create Account',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold))
                    ])),
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
