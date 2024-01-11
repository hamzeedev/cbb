import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/colors/AppColors.dart';
import '../../../view_model/controllers/upload_report_controller.dart';

class UploadYourReport extends StatelessWidget {
  UploadYourReport({super.key, required this.title, this.type});

  final String title;
  final String? type;
  final controller = Get.put(UploadReportController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery
          .sizeOf(context)
          .width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      decoration: const BoxDecoration(
          color: AppColors.primaryColor
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),),
          const SizedBox(height: 10,),
          Container(
            height: 45,
            width: MediaQuery
                .sizeOf(context)
                .width,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: GestureDetector(
              onTap: () => controller.picReport(),
              child: Row(
                children: [
                  Obx(() =>
                      Text(
                        controller.pickedReportName.isEmpty ?
                        'Submit your document' : controller.pickedReportName.value,
                        style: const TextStyle(
                            color: Colors.black
                        ),
                      )),
                  const Spacer(),
                  const VerticalDivider(),
                  GestureDetector(
                    onTap: () => controller.uploadReport(),
                    child: const Text('Upload',style: TextStyle(color: Colors.blue
                        ,fontWeight: FontWeight.bold
                    ),),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}