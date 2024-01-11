import 'package:cbb/data/network/firebase/services/make_post.dart';
import 'package:cbb/data/network/firebase/services/upload_file.dart';
import 'package:cbb/utils/utils.dart';
import 'package:cbb/view_model/controllers/user_data.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MakePostController extends GetxController {
  final title = TextEditingController();
  final description = TextEditingController();

  RxString pikedFileName = ''.obs;
  RxString pikedFilePath = ''.obs;
  RxString type = ''.obs;
  RxString size = ''.obs;

  picFile() async {
    final picker = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg', 'mp4', 'pdf'],
    );
    if (picker != null) {
      pikedFilePath.value = picker.paths[0]!;
      final double fileSize=picker.files[0].size/1024;

      if(fileSize>=1024){
        size.value='${(fileSize/1024).toStringAsFixed(0)} MB';
      }else{
        size.value='${fileSize.toStringAsFixed(0)} KB';
      }


      if (pikedFilePath.contains('.png') ||
          pikedFilePath.contains('.jpg') ||
          pikedFilePath.contains('.jpeg')) {
        type.value = 'image';
      } else if (pikedFilePath.contains('.mp4')) {
        type.value = 'video';
      } else if (pikedFilePath.contains('.pdf')) {
        type.value = 'pdf';
      } else {
        type.value = '';
        pikedFilePath.value = '';
        pikedFileName.value = '';
      }
      pikedFileName.value = picker.names[0]!;
    } else {
      type.value = '';
      pikedFilePath.value = '';
      pikedFileName.value = '';
    }
  }
  uploadPost() async {
    if (title.value.text.toString().isEmpty) {
      Utils.showSnackBar(
          'Warning',
          'Please enter title of post',
          const Icon(
            Icons.warning_amber,
            color: Colors.red,
          ));
      return;
    }


      Get.back();
      Utils.showSnackBar(
          'Post',
          'Your post is being uploaded! w\'ll notify you',
          const Icon(
            Icons.downloading,
            color: Colors.grey,
          ));
      //
      //
      // type.value = '';
      // pikedFilePath.value = '';
      // pikedFileName.value = '';
      // title.text='';
      // description.text='';



      String url = await UploadFile.uploadFile(
          filePath: pikedFilePath.value,
          uploadPath:
          'posts/${UserData.uid}/$type/${DateTime.now().microsecondsSinceEpoch}_$pikedFileName');
      MakePost.upload(
        postType: 'posts',
          url: url,
          size: size.value,
          title: title.value.text.toString(),
          description: description.value.text.toString(),
          fileName: pikedFileName.value,
          type: type.value,
          refType: 'posts');





  }
}
