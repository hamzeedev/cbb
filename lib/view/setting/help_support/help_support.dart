import 'package:cbb/view/setting/components/designed_setting_body.dart';
import 'package:flutter/material.dart';

import 'components/help_row.dart';
import 'components/question_box.dart';

class HelpSupport extends StatelessWidget {
  const HelpSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return const DesignedSettingBody(
        widget: Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Help & Support',
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hi Talha!'),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Top Questions',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                QuestionBox(
                  questionNo: 'Question # 01:',
                ),
                SizedBox(
                  height: 15,
                ),
                QuestionBox(
                  questionNo: 'Question # 02:',
                ),
                SizedBox(
                  height: 15,
                ),
                QuestionBox(
                  questionNo: 'Question # 03:',
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Still need help?',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                HelpSupportRow(
                  text: 'Chat with us',
                ),
                HelpSupportRow(
                  text: 'Call us',
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
