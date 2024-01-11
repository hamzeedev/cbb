import 'package:flutter/material.dart';

import '../../../../res/colors/AppColors.dart';

class NotificationRow extends StatelessWidget {
  const NotificationRow({super.key, required this.value, required this.title, this.onChange});
  final bool value;
  final String title;
  final Function(bool value)? onChange;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,style: TextStyle(
            color: Colors.black
        ),),
        Spacer(),
        Transform.scale(
          scale: 0.7,
          child: Switch(
            trackOutlineColor: const MaterialStatePropertyAll(
                Colors.transparent
            ),
            inactiveTrackColor: Colors.grey.withOpacity(.4),
            activeColor: AppColors.whiteColor,
            activeTrackColor: AppColors.primaryColor,
            value: value, onChanged: onChange,
          ),
        ),
      ],
    );
  }
}