import 'package:flutter/material.dart';
import 'package:cbb/view/home/components/app_top_header.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final List<NotificationItem> dummyNotifications = [
    NotificationItem(
      content: 'John Doe uploaded a new post.',
      time: DateTime.now().subtract(const Duration(minutes: 5)),
    ),
    NotificationItem(
      content: 'Alice liked your photo.',
      time: DateTime.now().subtract(const Duration(minutes: 10)),
    ),
    NotificationItem(
      content: 'Bob commented on your status.',
      time: DateTime.now().subtract(const Duration(minutes: 15)),
    ),
    NotificationItem(
      content: 'Eve mentioned you in a comment.',
      time: DateTime.now().subtract(const Duration(minutes: 20)),
    ),
    NotificationItem(
      content: 'Charlie sent you a friend request.',
      time: DateTime.now().subtract(const Duration(minutes: 25)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppTopHeader(
              title: "Notifications",
              show: false,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: dummyNotifications.length,
                itemBuilder: (context, index) {
                  final notification = dummyNotifications[index];
                  return Card(
                    child: ListTile(
                      title: Text(notification.content),
                      subtitle: Text(_formatTime(notification.time)),
                      leading: const Icon(Icons.notifications),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          _removeNotification(index);
                        },
                      ),
                      onTap: () {
                        // Handle tapping on a notification
                        print(
                            'Tapped on notification: ${notification.content}');
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    // Format time according to your requirements
    return '${time.hour}:${time.minute}';
  }

  void _removeNotification(int index) {
    setState(() {
      dummyNotifications.removeAt(index);
    });
  }
}

class NotificationItem {
  final String content;
  final DateTime time;

  NotificationItem({required this.content, required this.time});
}
