import 'package:cbb/view/home/components/app_top_header.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

class Announcement {
  final String title;
  final String description;
  final DateTime time;

  Announcement(this.title, this.description, this.time);
}

class NoticeBoard extends StatefulWidget {
  
  const NoticeBoard({super.key});

  @override
  State<NoticeBoard> createState() => _NoticeBoardState();
}

class _NoticeBoardState extends State<NoticeBoard> {
  late DatabaseReference _databaseReference;

  List<Announcement> announcements = [];

  @override
  void initState() {
    super.initState();
    // loadDummyData();
    _databaseReference = FirebaseDatabase.instance.ref().child('announcements');

    _databaseReference.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> announcementsData =
            event.snapshot.value as Map<dynamic, dynamic>;
        announcements.clear();
        announcementsData.forEach((key, value) {
          Announcement announcement = Announcement(
            value['title'],
            value['description'],
            DateTime.parse(value['time']),
          );
          announcements.add(announcement);
        });
        setState(() {});
      }
    });
  }

  // Dummy data for testing
  void loadDummyData() {
    List<Map<String, dynamic>> dummyData = [
      {
        'title': 'Important Announcement',
        'description': 'This is a test announcement.',
        'time': '2023-01-01 12:00 PM',
      },
      {
        'title': 'Another Announcement',
        'description': 'Testing the Notice Board widget.',
        'time': '2023-01-02 03:30 PM',
      },
      // Add more dummy data as needed
    ];

    announcements.clear();
    for (var data in dummyData) {
      Announcement announcement = Announcement(
        data['title'],
        data['description'],
        data['time'],
      );
      announcements.add(announcement);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          AppTopHeader(
            title: 'Notice Board',
            show: false,
            // widget: const Icon(
            //   Icons.more_vert_outlined,
            //   color: Colors.white,
            // ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: announcements.length,
              itemBuilder: (context, index) {
                Announcement announcement = announcements[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(announcement.title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(announcement.description),
                        Text(
                          DateFormat('MM/dd/yyyy hh:mm a')
                              .format(announcement.time),
                          // Format the DateTime using intl package
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ))
        ],
      )),
    );
  }
}
