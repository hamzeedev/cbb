import 'package:cbb/res/consants.dart';
import 'package:cbb/view/setting/components/designed_setting_body.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return DesignedSettingBody(
        widget: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Privacy Policy',style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),),
            const SizedBox(height: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...privacyPolicy.map((e) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(e['Question'].toString(),
                    style: const TextStyle(color: Colors.black,
                    fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),
                    ),
                    const SizedBox(height: 20,),
                    Text(e['Answer'].toString(),
                    style: const TextStyle(
                      color: Colors.black
                    ),
                    ),
                    const SizedBox(height: 20,)
                  ],
                ))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
