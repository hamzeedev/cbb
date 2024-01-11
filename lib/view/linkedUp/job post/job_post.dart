import 'package:cbb/res/colors/AppColors.dart';
import 'package:cbb/view/home/components/app_top_header.dart';
import 'package:cbb/view_model/controllers/job-post-controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';

class JobPostingPage extends StatefulWidget {
  const JobPostingPage({super.key});

  @override
  _JobPostingPageState createState() => _JobPostingPageState();
}

class _JobPostingPageState extends State<JobPostingPage> {
  final controller = Get.put(JobPostController());
  bool isFileUploaded = false;
  bool isFullTime = false;
  bool isInternship = false;
  String? filePath;

  Future<void> uploadFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'jpeg', 'png'],
      );

      if (result != null) {
        setState(() {
          filePath = result.files.single.path!;
          isFileUploaded = true;
        });
      } else {
        // User canceled the file picker
        // You can provide feedback or do nothing
      }
    } catch (e) {
      print('Error uploading file: $e');
      // Handle errors accordingly
    }
  }

  bool validateFields() {
    // Add your validation logic here
    // For example, check if title and description are not empty
    return controller.title.text.isNotEmpty &&
        controller.description.text.isNotEmpty;
  }

  void showFillFieldsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Incomplete Information'),
          content: const Text(
              'Please fill in the title and description before posting the job.'),
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
      context: context,
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
              onPressed: () {
                controller.postJob();
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
                "Job Post",
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
                      'Title',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      controller: controller.title,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      controller: controller.description,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Type',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Checkbox(
                          value: isFullTime,
                          onChanged: (value) {
                            setState(() {
                              isFullTime = value ?? false;
                              isInternship = false;

                              if (isFullTime) {
                                controller.type.value = 'Full Time';
                              } else {
                                controller.type.value = '';
                              }
                            });
                          },
                        ),
                        const Text('Full Time'),
                        const SizedBox(width: 16.0),
                        Checkbox(
                          value: isInternship,
                          onChanged: (value) {
                            setState(() {
                              isInternship = value ?? false;
                              if (isInternship) {
                                controller.type.value = 'Internship';
                              } else {
                                controller.type.value = '';
                              }
                              isFullTime = false;
                            });
                          },
                        ),
                        const Text('Internship'),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Center(
                      child: SizedBox(
                        width: 300,
                        child: Obx(() => ElevatedButton(
                              onPressed: () {
                                // Handle post job button tap
                                if (validateFields()) {
                                  if (controller.type.isEmpty) {
                                    Utils.showSnackBar(
                                        'Warning',
                                        'Please select job type',
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
                                  : const Text('Post Job'),
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
