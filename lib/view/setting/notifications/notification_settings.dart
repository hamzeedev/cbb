import 'package:cbb/view/setting/components/designed_setting_body.dart';
import 'package:flutter/material.dart';
import 'components/notification_row.dart';

class SettingNotification extends StatelessWidget {
  const SettingNotification({super.key});
  @override
  Widget build(BuildContext context) {
    return const DesignedSettingBody(
        widget: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Notifications',
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Common',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                NotificationRow(value: true, title: 'General Notifications'),
                NotificationRow(value: false, title: 'Sound'),
                NotificationRow(value: true, title: 'Vibrate'),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Divider(),
          SizedBox(
            height: 10,
          ),
          Text(
            'System & services update',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: NotificationRow(value: true, title: 'App Update'),
          ),
        ],
      ),
    ));
  }
}
