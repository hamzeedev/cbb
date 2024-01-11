import 'package:flutter/material.dart';

import '../../res/consants.dart';
import '../setting/components/designed_setting_body.dart';

class Faqs extends StatelessWidget {
  const Faqs({super.key});


  @override
  Widget build(BuildContext context) {
    return DesignedSettingBody(
        widget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Faqs',style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),),
                const SizedBox(height: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...faqs.map((e) => Column(
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
