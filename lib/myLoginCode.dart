// import 'dart:js';

// import 'package:chat_app/Models/userMode.dart';
// import 'package:chat_app/components/customTextField.dart';
// import 'package:chat_app/components/customeButton.dart';
// import 'package:chat_app/components/customeColors.dart';
// import 'package:chat_app/pages/homepage.dart';
// import 'package:chat_app/pages/signUp.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// final TextEditingController _emailController = TextEditingController();
// final TextEditingController _passwordController = TextEditingController();

// void checkValues() {
//   String email = _emailController.text.trim();
//   String password = _passwordController.text.trim();

//   if (email == "" || password == "") {
//     print("Please fill all the fields");
//   } else {
//     login(email, password);
//   }
// }

// void login(String email, String password) async {
//   UserCredential? credential;
//   try {
//     credential = await FirebaseAuth.instance
//         .signInWithEmailAndPassword(email: email, password: password);
//   } on FirebaseAuthException catch (e) {
//     print(e.message.toString());
//   }

//   if (credential != null) {
//     String uid = credential.user!.uid;
//     DocumentSnapshot userData =
//         await FirebaseFirestore.instance.collection('users').doc(uid).get();
//     UserModel userModel =
//         UserModel.fromMap(userData.data() as Map<String, dynamic>);

//     //goto home screen
//     print("Login Successful");
//     Navigator.push(
//         context as BuildContext,
//         MaterialPageRoute(
//             builder: (context) => Home_Page(
//                 userModel: userModel, firebaseUser: credential!.user!)));
//   }
// }

// class _LoginState extends State<Login> {
//   @override
//   Widget build(BuildContext context) {
//     login() {
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => SignUpPage()));
//     }

//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 const Text(
//                   "Chat App",
//                   style: TextStyle(
//                       color: CustomeColors.hintDark,
//                       fontSize: 40,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(
//                   height: 25,
//                 ),
//                 MyTextField(
//                     hintText: "Email",
//                     obscureText: false,
//                     controller: _emailController),
//                 const SizedBox(
//                   height: 25,
//                 ),
//                 MyTextField(
//                     hintText: 'Password',
//                     obscureText: true,
//                     controller: _passwordController),
//                 const SizedBox(
//                   height: 25,
//                 ),
//                 My_Button(
//                     text: 'Login',
//                     onPress: () {
//                       checkValues();
//                     }),
//                 // const SizedBox(
//                 //   height: 15,
//                 // ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "Not a member?",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w200,
//                           fontSize: 16,
//                           color: CustomeColors.hintDark),
//                     ),
//                     CupertinoButton(
//                       onPressed: () {
//                         setState(() {
//                           login();
//                         });
//                       },
//                       child: const Text("Sign Up",
//                           style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: CustomeColors.hintDark)),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
