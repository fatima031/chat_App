import 'package:chat_app/Models/userMode.dart';
import 'package:chat_app/pages/searchPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home_Page extends StatefulWidget {
  final UserModel userModel;
  final User firebaseUser;
  const Home_Page(
      {super.key, required this.userModel, required this.firebaseUser});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Chat App"),
        ),
        body: SafeArea(
          child: Container(),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchPage(
                          userModel: widget.userModel,
                          firebaseUser: widget.firebaseUser)));
            },
            child: Icon(Icons.search)));
  }
}
