import 'package:flutter/material.dart';
import 'package:flutter_fire/services/firebase_service.dart';
import 'package:flutter_fire/src/screens/sign_in_screen.dart';
import 'package:flutter_fire/src/widgets/button_widget.dart';
import 'package:flutter_fire/src/widgets/text_form_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('SignUp Screen'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextInputField(
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return ("Email is required.");
                } else {
                  return null;
                }
              },
              hintText: 'Email',
            ),
            TextInputField(
              controller: passController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return ("Password is required.");
                } else {
                  return null;
                }
              },
              hintText: 'Password',
            ),
            CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  FirebaseService.signUpMethod(
                    email: emailController.text.toString(),
                    password: passController.text.toString(),
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInScreen(),
                    ),
                  );
                }
              },
              btnName: 'Sign Up',
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "SignIn",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
