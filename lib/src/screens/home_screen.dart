import 'package:flutter/material.dart';
import 'package:flutter_fire/services/firebase_service.dart';
import 'package:flutter_fire/src/screens/add_bio_screen.dart';
import 'package:flutter_fire/src/screens/sign_in_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //

  // final textController = TextEditingController();
  // final formKey = GlobalKey<FormState>();

  // @override
  // void dispose() {
  //   textController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text('Home Page'),
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddBioScreen(),
            ),
          );
        },
        child: Icon(Icons.add_a_photo),
      ),
      body: Center(
        child: Text('Your bio :'),
      ),
    );
  }
}
