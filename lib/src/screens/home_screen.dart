import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_fire/src/screens/add_bio_screen.dart';

class HomeScreen extends StatelessWidget {
  // final String userId;

  // const HomeScreen({required this.userId});

  final data = FirebaseFirestore.instance
      .collection('userBio')
      // .where('userId', isEqualTo: userId)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bio Page'),
      ),
      body: Text('data'),

      // StreamBuilder<QuerySnapshot>(
      //   stream: data,
      //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     if (snapshot.hasError) {
      //       return Center(
      //         child: Text('Error: ${snapshot.error}'),
      //       );
      //     }
      //     if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
      //       return Center(
      //         child: Text('No bio found for user'),
      //       );
      //     }

      //     // final bioData =
      //     //     snapshot.data!.docs.first.data() as Map<String, dynamic>;

      //     return Expanded(
      //       child: ListView.builder(
      //           // shrinkWrap: true,
      //           itemCount: snapshot.data!.docs.length,
      //           itemBuilder: (context, index) {
      //             return ListTile(
      //               title: Text(snapshot.data!.docs[index].id),
      //             );
      //             // Center(
      //             //   child: Text('Bio: ${bioData['bio']}'),
      //             // );
      //           }),
      //     );
      //   },
      // ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddBioScreen(),
            ),
          );
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
