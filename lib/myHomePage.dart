// import 'package:chat_app/Models/chatRoom_Model.dart';
// import 'package:chat_app/Models/firebaseHelper.dart';
// import 'package:chat_app/Models/uiHelper.dart';
// import 'package:chat_app/Models/userMode.dart';
// import 'package:chat_app/pages/chatRoomPage.dart';
// import 'package:chat_app/pages/login.dart';
// import 'package:chat_app/pages/searchPage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class Home_Page extends StatefulWidget {
//   final UserModel userModel;
//   final User firebaseUser;
//   const Home_Page(
//       {super.key, required this.userModel, required this.firebaseUser});

//   @override
//   State<Home_Page> createState() => _Home_PageState();
// }

// class _Home_PageState extends State<Home_Page> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text("Chat App"),
//           actions: [
//             IconButton(
//                 onPressed: () async {
//                   await FirebaseAuth.instance.signOut();
//                   Navigator.popUntil(context, (route) => route.isFirst);
//                   Navigator.pushReplacement(context,
//                       MaterialPageRoute(builder: (context) => LoginPage()));
//                 },
//                 icon: Icon(Icons.exit_to_app))
//           ],
//         ),
//         body: SafeArea(
//           child: Container(
//             child: StreamBuilder(
//                 stream: FirebaseFirestore.instance
//                     .collection('chatrooms')
//                     .where("user" , arrayContains: widget.userModel.uid).orderBy("createdon")
//                     .snapshots(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.active) {
//                     if (snapshot.hasData) {
//                       QuerySnapshot chatRoomSnapshot =
//                           snapshot.data as QuerySnapshot;
//                       return ListView.builder(
//                           itemCount: chatRoomSnapshot.docs.length,
//                           itemBuilder: (context, index) {
//                             ChatRoomModel chatRoomModel = ChatRoomModel.fromMap(
//                                 chatRoomSnapshot.docs[index].data()
//                                     as Map<String, dynamic>);

//                             Map<String, dynamic> participants =
//                                 chatRoomModel.participants!;

//                             List<String> participantKeys =
//                                 participants.keys.toList();

//                             participantKeys.remove(widget.userModel.uid);

//                             return FutureBuilder(
//                                 future: FirebaseHelper.getUserModelById(
//                                     participantKeys[0]),
//                                 builder: (context, userData) {
//                                   if (userData.connectionState ==
//                                       ConnectionState.done) {
//                                     if (userData.data != null) {
//                                       UserModel targetUser =
//                                           userData.data as UserModel;

//                                       return ListTile(
//                                           onTap: () {
//                                             Navigator.push(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         ChatRoomPage(
//                                                             targetUser:
//                                                                 targetUser,
//                                                             chatroom:
//                                                                 chatRoomModel,
//                                                             userModel: widget
//                                                                 .userModel,
//                                                             firebaseUser: widget
//                                                                 .firebaseUser)));
//                                           },
//                                           leading: CircleAvatar(
//                                             backgroundImage: NetworkImage(
//                                                 targetUser.profilepic
//                                                     .toString()),
//                                           ),
//                                           title: Text(
//                                               targetUser.fullname.toString()),
//                                           subtitle: (chatRoomModel.lastMessage
//                                                       .toString() !=
//                                                   "")
//                                               ? Text(chatRoomModel.lastMessage
//                                                   .toString())
//                                               : Text(
//                                                   "Say Hi To Your New Friend",
//                                                   style: TextStyle(
//                                                       color:
//                                                           Colors.blue.shade200),
//                                                 ));
//                                     } else {
//                                       return Container();
//                                     }
//                                   } else {
//                                     return Container();
//                                   }
//                                 });
//                           });
//                     } else if (snapshot.hasError) {
//                       return Center(
//                         child: Text(snapshot.error.toString()),
//                       );
//                     } else {
//                       return Center(
//                         child: Text("No Chats"),
//                       );
//                     }
//                   } else {
//                     return Center(
//                       child: LinearProgressIndicator(),
//                     );
//                   }
//                 }),
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//             onPressed: () {
//               // UIHelper.showLoadingDialog(context, "Loading...");
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => SearchPage(
//                           userModel: widget.userModel,
//                           firebaseUser: widget.firebaseUser)));
//             },
//             child: Icon(Icons.search)));
//   }
// }
