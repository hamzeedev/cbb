import 'package:cbb/view_model/controllers/user_data.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/network/firebase/services/make_post.dart';
import '../../data/network/firebase/services/upload_file.dart';
import '../../utils/utils.dart';

class UploadPaperController extends GetxController{
  RxString pickedPaperName=''.obs;
  RxString pikedPaperPath = ''.obs;
  RxString type = ''.obs;
  RxString size = ''.obs;



  picPaper() async {
    final picker = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (picker != null) {
      pikedPaperPath.value = picker.paths[0]!;
      final double fileSize=picker.files[0].size/1024;

      if(fileSize>=1024){
        size.value='${(fileSize/1024).toStringAsFixed(0)} MB';
      }else{
        size.value='${fileSize.toStringAsFixed(0)} KB';
      }

      pickedPaperName.value = picker.names[0]!;
    } else {
      type.value = '';
      pikedPaperPath.value = '';
      pickedPaperName.value = '';
    }
  }
  uploadPaper() async {
    if (pikedPaperPath.isEmpty) {
      Utils.showSnackBar(
          'Warning',
          'Please select a research paper',
          const Icon(
            Icons.warning_amber,
            color: Colors.red,
          ));
      return;
    }
    Utils.showSnackBar(
        'Post',
        'Your paper is being uploaded! w\'ll notify you',
        const Icon(
          Icons.downloading,
          color: Colors.grey,
        ));

    String _type=type.value;
    String _pikedPaperPath=pikedPaperPath.value;
    String _pickedPaperName=pickedPaperName.value;
    type.value = '';
    pikedPaperPath.value = '';
    pickedPaperName.value = '';

    String url = await UploadFile.uploadFile(
        filePath: _pikedPaperPath,
        uploadPath:
        'papers/${UserData.uid}/${DateTime.now().microsecondsSinceEpoch}_$_pickedPaperName');
    MakePost.upload(
      postType: 'papers',
        url: url,
        size: size.value,
        title: _pickedPaperName,
        description: '',
        fileName: _pickedPaperName,
        type: 'pdf',
        refType: 'papers');





  }


}