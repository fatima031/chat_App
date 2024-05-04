// import 'package:chat_app/Models/userMode.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class SearchPage extends StatefulWidget {
//   final UserModel userModel;
//   final User firebaseUser;
//   const SearchPage(
//       {super.key, required this.userModel, required this.firebaseUser});

//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   @override
//   TextEditingController searchController = TextEditingController();
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Search Page"),
//       ),
//       body: SafeArea(
//           child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         child: Column(
//           children: [
//             TextField(
//               controller: searchController,
//               decoration: InputDecoration(label: Text("Email Address")),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             CupertinoButton(
//                 color: Colors.blue,
//                 child: Text("Search"),
//                 onPressed: () {
//                   setState(() {});
//                 }),
//             SizedBox(
//               height: 20,
//             ),
//             StreamBuilder(
//                 stream: FirebaseFirestore.instance
//                     .collection('users')
//                     .where('email', isEqualTo: searchController.text)
//                     .where('email', isNotEqualTo: widget.userModel.email)
//                     .snapshots(),
//                 builder: (context, snapshort) {
//                   if (snapshort.connectionState == ConnectionState.active) {
//                     if (snapshort.hasData) {
//                       QuerySnapshot dataSnapshot =
//                           snapshort.data as QuerySnapshot;

//                       if (dataSnapshot.docs.length > 0) {
//                         Map<String, dynamic> userMap =
//                             dataSnapshot.docs[0].data() as Map<String, dynamic>;
//                         UserModel searchedUser = UserModel.fromMap(userMap);
//                         return ListTile(
                          
//                           title: Text(searchedUser.fullName!),
//                           subtitle: Text(searchedUser.email!),
//                           trailing: Icon(Icons.keyboard_arrow_right),
//                         );
//                       }
//                       else {
//                         return Text("No results found!");
//                       }
                      
//                     }
//                     else if(snapshort.hasError) {
//                       return Text("An error occured!");
//                     }
//                     else {
//                       return Text("No results found!");
//                     }
//                   }
//                   else {
//                     return CircularProgressIndicator();
//                   }
//                 }
//                 )
//           ],
//         ),
//       )),
//     );
//   }
// }
