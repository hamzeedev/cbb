import 'package:cbb/view/home/components/app_top_header.dart';
import 'package:cbb/view/linkedUp/apply-job/appy-job.dart';
import 'package:cbb/view/linkedUp/job%20post/job_post.dart';
import 'package:cbb/view_model/controllers/user_data.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LinkedUpPage extends StatelessWidget {
  const LinkedUpPage({super.key, this.backOk = false});
  final bool backOk;
  @override
  Widget build(BuildContext context) {
    print(UserData.role);
    return Scaffold(
      floatingActionButton: UserData.role.toLowerCase() == 'student'
          ? null
          : FloatingActionButton(
              onPressed: () {
                Get.to(const JobPostingPage());
              },
              child: const Icon(Icons.add),
            ),
      body: SafeArea(
        child: Column(
          children: [
            AppTopHeader(
              title: 'Linked UP',
              backOk: backOk,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: FirebaseAnimatedList(
                query: FirebaseDatabase.instance.ref('jobs'),
                itemBuilder: (context, snapshot, animation, index) {
                  return JobCard(
                    snapshot: snapshot,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final DataSnapshot snapshot;
  const JobCard({
    super.key,
    required this.snapshot,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100.0,
              height: 130.0,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/job1.png'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          snapshot.child('jobTitle').value.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      // IconButton(
                      //   icon: const Icon(Icons.bookmark_border),
                      //   onPressed: () {
                      //     // Handle bookmark button tap
                      //   },
                      // ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    snapshot.child('jobDescription').value.toString(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20.0,
                        backgroundImage: AssetImage('assets/profile.png'),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot
                                  .child('sender')
                                  .child('senderName')
                                  .value
                                  .toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              snapshot.child('uploadDate').value.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => ApplyForJob(snapshot: snapshot));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6ec8e4),
                          ),
                          child: const Text('Apply'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
