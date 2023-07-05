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
        title: Text('Add bio'),
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
              hintText: 'Enter your bio...',
            ),
            CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  FirebaseService.addBioInToFirestoreDB(
                    bio: textController.text.toString(),
                  );
                }
                textController.clear();
              },
              btnName: 'Submit',
            ),
          ],
        ),
      ),
    );
  }
}
