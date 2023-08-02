import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_fire/services/firebase_service.dart';
import 'package:flutter_fire/src/screens/add_bio_screen.dart';
import 'package:flutter_fire/src/screens/sign_in_screen.dart';
import 'package:flutter_fire/src/screens/upload_image.dart';

class HomeScreen extends StatelessWidget {
  final data = FirebaseFirestore.instance.collection('userBio').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.teal,
        automaticallyImplyLeading: false,
        title: Text('My Bio'),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseService.logOutMethod();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignInScreen(),
                ),
              );
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: data,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          List<QueryDocumentSnapshot> document = snapshot.data!.docs;

          return ListView.builder(
            shrinkWrap: true,
            itemCount: document.length,
            itemBuilder: (context, index) {
              QueryDocumentSnapshot data = document[index];
              return ListTile(
                title: Text(data['bio']),
                subtitle: Text(data['id']),
              );
            },
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "fab1",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UploadImage(),
                ),
              );
            },
            child: Icon(Icons.add_a_photo),
          ),
          SizedBox(height: 20),
          FloatingActionButton(
            heroTag: "fab2",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddBioScreen(),
                ),
              );
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
