import 'package:cbb/view_model/controllers/appy-job-controller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/colors/AppColors.dart';
import '../../../utils/utils.dart';

class ApplyForJob extends StatelessWidget {
  ApplyForJob({super.key, required this.snapshot});
  final DataSnapshot snapshot;
  final controller = Get.put(ApplyJobController());
  bool validateFields() {
    // Add your validation logic here
    // For example, check if title and description are not empty
    return controller.name.text.isNotEmpty &&
        controller.email.text.isNotEmpty &&
        controller.about.text.isNotEmpty;
  }

  void showFillFieldsDialog() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Incomplete Information'),
          content: const Text('Please fill in the details before applying.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showConfirmationDialog() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Job Posting'),
          content: const Text('Are you sure to post this job.'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Cancle'),
            ),
            TextButton(
              onPressed: controller.loading.value
                  ? null
                  : () {
                      controller.apply(snapshot: snapshot);
                    },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 170,
            width: double.infinity,
            color: AppColors.primaryColor,
            child: const Center(
              child: Text(
                "Apply for Job",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      controller: controller.name,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      controller: controller.email,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      'About',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      controller: controller.about,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    GestureDetector(
                      onTap: () => controller.picCV(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Obx(() => controller.fileName.isEmpty
                            ? const Text(
                                'Upload Your CV',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              )
                            : Text(
                                controller.fileName.value,
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              )),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Center(
                      child: SizedBox(
                        width: 300,
                        child: Obx(() => ElevatedButton(
                              onPressed: () {
                                // Handle post job button tap
                                if (validateFields()) {
                                  if (controller.fileName.isEmpty) {
                                    Utils.showSnackBar(
                                        'Warning',
                                        'Please select your cv',
                                        const Icon(
                                          Icons.warning_amber,
                                          color: Colors.red,
                                        ));
                                    return;
                                  }
                                  showConfirmationDialog();
                                } else {
                                  showFillFieldsDialog();
                                  // Fields are not filled, provide feedback or take appropriate action
                                }
                              },
                              child: controller.loading.value
                                  ? const SizedBox(
                                      height: 14,
                                      width: 14,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Text('Apply'),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
