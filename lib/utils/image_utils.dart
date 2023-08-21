import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUtils {
  //

  static Future pickImageFromGallery() async {
    try {
      XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (file != null) {
        return await file.readAsBytes();
      } else {
        debugPrint('No image selected');
      }
    } catch (e) {
      debugPrint('Unable to pick image : $e');
    }
  }

  static Future<String> addImageIntoDB({
    required String storagePath,
    required Uint8List imageFile,
  }) async {
    try {
      Reference reference = FirebaseStorage.instance.ref().child(storagePath);

      UploadTask uploadTask = reference.putData(imageFile);

      TaskSnapshot snapshot = await uploadTask;

      String getImgUrl = await snapshot.ref.getDownloadURL();
      debugPrint('ImageUrl : $getImgUrl');
      return getImgUrl;
    } catch (error) {
      debugPrint("Unable to upload image: $error");
      return '';
    }
  }
}
