import 'package:flutter/material.dart';
import 'package:flutter_fire/services/firebase_service.dart';
import 'package:flutter_fire/src/widgets/button_widget.dart';
import 'package:flutter_fire/src/widgets/text_form_widget.dart';

class AddBioScreen extends StatefulWidget {
  const AddBioScreen({super.key});

  @override
  State<AddBioScreen> createState() => _AddBioScreenState();
}

class _AddBioScreenState extends State<AddBioScreen> {
  //

  final textController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool get isBioFieldFill => textController.text.isNotEmpty;

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: Text('Add Bio'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextInputField(
              controller: textController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return ("Field is required.");
                } else {
                  return null;
                }
              },
              onChanged: (value) {
                setState(() {});
              },
              hintText: 'Enter your bio...',
            ),
            CustomButton(
              btnName: 'Add Bio',
              btnBgColor: isBioFieldFill ? Colors.lightBlue : Colors.grey,
              onPressed: isBioFieldFill
                  ? () {
                      if (formKey.currentState!.validate()) {
                        FirebaseService.addBioInToFirestoreDB(
                          bio: textController.text.toString(),
                        ).then((value) {
                          textController.clear();
                          Navigator.pop(context);
                        });
                      }
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
