import 'package:cbb/view/setting/components/setting_header_rounded.dart';
import 'package:flutter/material.dart';

class DesignedSettingBody extends StatelessWidget {
  const DesignedSettingBody({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          const SettingHeaderRounded(),
          Card(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 200),
            surfaceTintColor: Colors.white,
            elevation: 5,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height - 200,
              child: widget,
            ),
          )
        ],
      )),
    );
  }
}
