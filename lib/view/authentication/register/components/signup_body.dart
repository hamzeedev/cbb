import 'package:cbb/view/authentication/register/components/signup_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../view_model/controllers/signup_controller.dart';
import '../../../onboarding/components/account_btn.dart';

class SignupBody extends StatelessWidget {
  SignupBody({super.key});
  final controller = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Form(
              key: controller.formKey,
              child: SignupFields()),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Obx(() => Checkbox(
                value: controller.isChecked.value,
                activeColor: Colors.blue,
                // checkColor: Colors.blue,
                side: const BorderSide(
                    color: Colors.blue
                ),
                onChanged: (value) => controller.isChecked.value = value!,
              ),),
              const Expanded(child: Column(
                children: [
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: 'signing up, you agree with the ',
                        style: TextStyle(
                            fontSize: 12
                        )
                    ),
                    TextSpan(
                        text: 'Terms of service and Privacy Policy',
                        style: TextStyle(color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 12

                        )
                    )
                  ])),
                ],
              ))
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Obx(() => AccountBtn(
              height: 40,
              width: 120,
              color: Colors.blue,
              loading: controller.loading.value,
              txt: 'Sign up',
              onTap: () => controller.createAccount(),
            )),
          ),
          const SizedBox(
            height: 30,
          ),

        ],
      ),
    );
  }
}