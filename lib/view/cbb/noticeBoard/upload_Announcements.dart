// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';

// class Announcement {
//   final String title;
//   final String description;
//   final String time;

//   Announcement(this.title, this.description, this.time);
// }

// class UploadAnnouncementPage extends StatefulWidget {
//   const UploadAnnouncementPage({Key? key}) : super(key: key);

//   @override
//   _UploadAnnouncementPageState createState() => _UploadAnnouncementPageState();
// }

// class _UploadAnnouncementPageState extends State<UploadAnnouncementPage> {
//   late DatabaseReference _databaseReference;
//   late TextEditingController _titleController;
//   late TextEditingController _descriptionController;

//   @override
//   void initState() {
//     super.initState();
//     _databaseReference =
//         FirebaseDatabase.instance.reference().child('announcements');
//     _titleController = TextEditingController();
//     _descriptionController = TextEditingController();
//   }

//   Future<void> _uploadAnnouncement() async {
//     try {
//       // Add announcement data to Firebase Realtime Database
//       Map<String, dynamic> announcementData = {
//         'title': _titleController.text,
//         'description': _descriptionController.text,
//         'time': DateTime.now().toIso8601String(),
//       };
//       _databaseReference.push().set(announcementData);

//       // Clear text controllers
//       _titleController.clear();
//       _descriptionController.clear();

//       // Show success message or navigate to another page
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         content: Text('Announcement uploaded successfully'),
//       ));
//     } catch (e) {
//       print('Error uploading announcement: $e');
//       // Handle the error
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         content: Text('Error uploading announcement'),
//       ));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Upload Announcement'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: _titleController,
//               decoration: const InputDecoration(labelText: 'Title'),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: _descriptionController,
//               decoration: const InputDecoration(labelText: 'Description'),
//               maxLines: 3,
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _uploadAnnouncement,
//               child: const Text('Upload Announcement'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
