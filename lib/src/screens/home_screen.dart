import 'package:flutter/material.dart';
import 'package:flutter_fire/services/firebase_service.dart';
import 'package:flutter_fire/src/screens/sign_in_screen.dart';
import 'package:flutter_fire/src/widgets/button_widget.dart';
import 'package:flutter_fire/src/widgets/text_form_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        actions: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  FirebaseService.logOutMethod();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInScreen(),
                    ),
                  );
                },
                child: Text('Logout'),
              ),
              SizedBox(width: 20),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_a_photo),
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
