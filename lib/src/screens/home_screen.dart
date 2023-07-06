// import 'package:flutter/material.dart';
// import 'package:flutter_fire/services/firebase_service.dart';
// import 'package:flutter_fire/src/screens/add_bio_screen.dart';
// import 'package:flutter_fire/src/screens/sign_in_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   //

//   // final textController = TextEditingController();
//   // final formKey = GlobalKey<FormState>();

//   // @override
//   // void dispose() {
//   //   textController.dispose();
//   //   super.dispose();
//   // }

//   @override
//   void initState() {
//     // FirebaseService.fetchBioFromFirestoreDB();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         elevation: 0,
//         title: Text('Home Page'),
//         actions: [
//           Row(
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   FirebaseService.logOutMethod();

//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => SignInScreen(),
//                     ),
//                   );
//                 },
//                 child: Text('Logout'),
//               ),
//               SizedBox(width: 20),
//             ],
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => AddBioScreen(),
//             ),
//           );
//         },
//         child: Icon(Icons.edit),
//       ),
//       body: Center(
//         child: Text('Your bio :'),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatelessWidget {
  final String userId;

  const HomeScreen({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bio Page'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('userBio')
            .where('userId', isEqualTo: userId)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No bio found for user: $userId'),
            );
          }

          final bioData =
              snapshot.data!.docs.first.data() as Map<String, dynamic>;

          return Center(
            child: Text('Bio: ${bioData['bio']}'),
          );
        },
      ),
    );
  }
}
