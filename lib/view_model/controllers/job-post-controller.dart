import 'package:cbb/data/network/firebase/services/upload-job.dart';
import 'package:cbb/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobPostController extends GetxController{
  final title=TextEditingController();
  final description=TextEditingController();
  RxString type=''.obs;
  RxBool loading=false.obs;


  postJob(){
    Get.back();
    UploadJob.upload();

  }



}