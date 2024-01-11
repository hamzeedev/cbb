import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/colors/AppColors.dart';

class CbbBtn extends StatelessWidget {
  const CbbBtn(
      {super.key, this.onTap, required this.iconData, required this.data});
  final VoidCallback? onTap;
  final IconData iconData;
  final String data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        width: 90,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.primaryColor, width: 2)),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: AppColors.primaryColor,
              size: 40,
            ).marginZero.paddingZero,
            Text(
              data,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}
