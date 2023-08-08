import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_fire/src/widgets/button_widget.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  //
  File? image;

  Future pickImgFromGallery() async {
    try {
      final pickedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );

      if (pickedImage == null) return;
      final imagePath = File(pickedImage.path);

      setState(() {
        image = imagePath;
      });
    } catch (e) {
      debugPrint('Unable to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: Text('Upload image'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: () {
                pickImgFromGallery();
              },
              child: Container(
                height: 300,
                width: 300,
                margin: EdgeInsets.only(bottom: 40),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: (image != null)
                    ? Image.file(
                        image!,
                        fit: BoxFit.cover,
                      )
                    : Icon(Icons.image),
              ),
            ),
          ),
          CustomButton(
            onPressed: () {},
            btnName: 'Upload image',
          ),
        ],
      ),
    );
  }
}
