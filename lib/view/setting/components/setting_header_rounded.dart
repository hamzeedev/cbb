import 'package:cbb/view/setting/components/setting_header.dart';
import 'package:flutter/material.dart';

import '../../../res/colors/AppColors.dart';

class SettingHeaderRounded extends StatelessWidget {
  const SettingHeaderRounded({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: const EdgeInsets.only(bottom: 50, left: 20, right: 20),
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
      ),
      child:  SettingHeaderBody(),
    );
  }
}
