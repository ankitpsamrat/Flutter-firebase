import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_fire/src/widgets/button_widget.dart';
import 'package:flutter_fire/utils/image_utils.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  //
  Uint8List? image;

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
              onTap: () async {
                Uint8List file = await ImageUtils.pickImageFromGallery();
                setState(() {
                  image = file;
                });
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
                    ? Image.memory(
                        image!,
                        fit: BoxFit.cover,
                      )
                    : Icon(Icons.image),
              ),
            ),
          ),
          SizedBox(height: 40),
          CustomButton(
            btnName: 'Upload image',
            btnBgColor: (image != null) ? Colors.lightBlue : Colors.grey,
            onPressed: (image != null)
                ? () {
                    String fileName =
                        '${DateTime.now().millisecondsSinceEpoch}.jpg';

                    ImageUtils.addImageIntoDB(
                      storagePath: 'images/$fileName',
                      imageFile: image!,
                    ).then((value) => Navigator.pop(context));
                  }
                : null,
          ),
        ],
      ),
    );
  }
}
