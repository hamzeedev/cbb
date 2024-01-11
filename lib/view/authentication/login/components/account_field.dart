import 'package:flutter/material.dart';
import '../../../../res/colors/AppColors.dart';

class AccountTextFields extends StatelessWidget {
  const AccountTextFields(
      {super.key,
      required this.title,
      required this.hint,
      required this.controller,
      this.password = false,
      this.validator,
      this.maxLength,
      this.maxLines,
      this.type});

  final String title;
  final String hint;
  final int? maxLength;
  final int? maxLines;
  final TextInputType? type;
  final bool password;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          Text(
            title,
            style: TextStyle(
                color: Colors.black.withOpacity(.8), fontSize: 17, height: 0),
          ),
        TextFormField(
          maxLength: maxLength,
          controller: controller,
          maxLines: maxLines,
          keyboardType: type,
          validator: validator,
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              counterText: '',
              hoverColor: AppColors.primaryColor,
              focusColor: AppColors.primaryColor,
              hintText: hint,
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor))),
        )
      ],
    );
  }
}
