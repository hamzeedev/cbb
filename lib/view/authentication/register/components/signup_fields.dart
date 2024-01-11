import 'package:cbb/res/colors/AppColors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../view_model/controllers/signup_controller.dart';
import '../../login/components/account_field.dart';

class RoleModel {
  String role = 'Student';
}

class SignupFields extends StatelessWidget {
  SignupFields({super.key});
  final controller = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AccountTextFields(
          controller: controller.userName,
          hint: 'Enter you name',
          maxLength: 30,
          title: 'Username',
          validator: (p0) {
            if (p0!.isEmpty) {
              return 'Please Enter correct name';
            } else {
              return null;
            }
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Role",
          style: TextStyle(
              color: Colors.black.withOpacity(.8), fontSize: 17, height: 0),
        ),
        Obx(() => DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  counterText: '',
                  hoverColor: AppColors.primaryColor,
                  focusColor: AppColors.primaryColor,
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryColor)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primaryColor))),
              value: controller.roleModel.value.role,
              onChanged: (String? newValue) {
                controller.setRole(newValue!);
              },
              items:
                  <String>['Student', 'Alumni', 'Teacher'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              icon: const Icon(Icons.arrow_drop_down,
                  color: AppColors.primaryColor),
            )),
        // const SizedBox(
        //   height: 20,
        // ),
        // AccountTextFields(
        //   controller: controller.role,
        //   hint: 'What is your Role (eg. Student)',
        //   title: 'Role',
        //   validator: (p0) {
        //     if (p0!.isEmpty) {
        //       return 'Enter your role';
        //     } else {
        //       return null;
        //     }
        //   },
        // ),
        const SizedBox(
          height: 20,
        ),
        AccountTextFields(
          controller: controller.email,
          hint: 'abc@gmail.com',
          title: 'Email',
          validator: (p0) {
            if (p0!.isEmpty) {
              return 'Please enter valid email';
            } else if (!EmailValidator.validate(p0)) {
              return 'Please enter valid email';
            } else {
              return null;
            }
          },
        ),
        const SizedBox(
          height: 20,
        ),
        AccountTextFields(
          controller: controller.phoneNumber,
          hint: '+92-300-1234567',
          title: 'Phone Number',
          type: TextInputType.phone,
          validator: (p0) {
            if (p0!.isEmpty) {
              return 'Invalid Phone Number';
            } else if (p0.length < 8) {
              return 'Invalid phone Number';
            } else {
              return null;
            }
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Text('Date of Birth',
            style: TextStyle(
                color: Colors.black.withOpacity(.8), fontSize: 17, height: 0)),
        Row(
          children: [
            SizedBox(
                width: 50,
                child: AccountTextFields(
                    title: '',
                    maxLength: 2,
                    hint: 'DD',
                    type: TextInputType.number,
                    validator: (p0) {
                      if ((p0!.isEmpty || int.parse(p0) < 1) ||
                          int.parse(p0) > 31) {
                        return 'invalid';
                      } else {
                        return null;
                      }
                    },
                    controller: controller.dd)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('/'),
            ),
            SizedBox(
                width: 50,
                child: AccountTextFields(
                    title: '',
                    maxLength: 2,
                    hint: 'MM',
                    type: TextInputType.number,
                    validator: (p0) {
                      if ((p0!.isEmpty || int.parse(p0) < 1) ||
                          int.parse(p0) > 12) {
                        return 'invalid';
                      } else {
                        return null;
                      }
                    },
                    controller: controller.mm)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('/'),
            ),
            SizedBox(
                width: 50,
                child: AccountTextFields(
                    title: '',
                    maxLength: 4,
                    hint: 'YYYY',
                    type: TextInputType.number,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'invalid';
                      } else if (p0.length < 4) {
                        return 'invalid';
                      } else {
                        return null;
                      }
                    },
                    controller: controller.yyyy)),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        AccountTextFields(
          controller: controller.password,
          hint: 'Enter your password',
          title: 'Password',
          validator: (p0) {
            if (p0!.isEmpty) {
              return 'Password length should be greater than 6';
            } else if (p0.length < 6) {
              return 'Password length should be greater than 6';
            } else {
              return null;
            }
          },
        ),
        const SizedBox(
          height: 20,
        ),
        AccountTextFields(
          controller: controller.confirmPassword,
          hint: 'Enter password again',
          title: 'Confirm Password',
          validator: (p0) {
              if (p0 != controller.password.value.text.toString()) {
              return 'Password mismatched';
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }
}
