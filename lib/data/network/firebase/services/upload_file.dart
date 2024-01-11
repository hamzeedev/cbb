import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../../../utils/utils.dart';

class UploadFile {
  static Future<String> uploadFile({
    required String filePath,
    required String uploadPath,
  }) async {
      FirebaseStorage storage = FirebaseStorage.instance;
      var sRef = storage
          .ref(uploadPath);
      var uploadTask = sRef.putFile(File(filePath));
      await Future.value(uploadTask);
      String url=await sRef.getDownloadURL();
      return url;
    }
}
