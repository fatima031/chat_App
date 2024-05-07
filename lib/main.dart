import 'package:chat_app/Models/firebaseHelper.dart';
import 'package:chat_app/Models/userMode.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/pages/homepage.dart';
// import 'package:chat_app/pages/complete_profile.dart';
import 'package:chat_app/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

// import "package:flutter_web_ui/flutter_web_ui.dart";
// import 'package:uuid/uuid.dart';

var uuid = Uuid();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  User? currentUser = FirebaseAuth.instance.currentUser;

  if (currentUser != null) {
    //logged in
    UserModel? thisUserModel =
        await FirebaseHelper.getUserModelById(currentUser.uid);

    if (thisUserModel != null) {
      runApp(
          MyAppLoggedIn(userModel: thisUserModel, firebaseUser: currentUser));
    } else
      runApp(MyApp());
  } else {
    //not logged in

    runApp(MyApp());
  }
}

//not logged in
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

//already logged in
class MyAppLoggedIn extends StatelessWidget {
  final UserModel userModel;
  final User firebaseUser;

  const MyAppLoggedIn(
      {super.key, required this.userModel, required this.firebaseUser});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(userModel: userModel, firebaseUser: firebaseUser),
    );
  }
}
