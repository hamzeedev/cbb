import 'package:cbb/data/network/firebase/services/upload_file.dart';
import 'package:cbb/utils/utils.dart';
import 'package:cbb/view_model/controllers/user_data.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplyJobController extends GetxController {
  final name = TextEditingController();
  final email = TextEditingController();
  final about = TextEditingController();
  RxString fileName = ''.obs;
  RxString filePath = ''.obs;
  RxBool loading = false.obs;

  picCV() async {
    final picker = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        allowedExtensions: ['pdf'],
        type: FileType.custom);

    if (picker != null) {
      fileName.value = picker.files[0].name;
      filePath.value = picker.files[0].path!;
    } else {
      fileName.value = '';
      filePath.value = '';
    }
  }

  apply({required DataSnapshot snapshot}) async {
    Get.back();
    loading.value=true;
    final jobSnapshot = await FirebaseDatabase.instance
        .ref('jobs')
        .child(snapshot.child('key').value.toString())
        .child('applied')
        .child(UserData.uid)
        .get();

    if(jobSnapshot.exists){
      loading.value=false;
      Get.back();
      Utils.showSnackBar('Application exist', 'Already applied for this job', Icon(Icons.warning_amber,color: Colors.red,));
    }else{
      try{
        UploadFile.uploadFile(filePath: filePath.value, uploadPath: 'jobs/cvs/${DateTime.now().microsecondsSinceEpoch.toString()}$fileName')
            .then((url) async {
          await FirebaseDatabase.instance.ref('jobs').child(snapshot.child('key').value.toString()).child('applied')
              .child(UserData.uid).set({
            'name' : name.value.text.toString(),
            'email' : email.value.text.toString(),
            'phone' : UserData.phoneNumber,
            'about' : about.value.text.toString(),
            'profilePicture' : UserData.profilePicture,
            'applyDate' : Utils.getCurrentDate(),
            'applyTime' : Utils.getCurrentTime(),
            'cv' : url,
          });
          loading.value=false;
          Get.back();
          Utils.showSnackBar('Success', 'Successfully Applied for this job', Icon(Icons.done_all,color: Colors.grey,));

        });
      }catch(e){
        loading.value=false;
        Get.back();
        Utils.showSnackBar('Success', 'Unable to apply! try again', Icon(Icons.done_all,color: Colors.grey,));
      }




    }







  }
}
