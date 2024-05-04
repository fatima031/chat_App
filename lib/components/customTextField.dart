import 'package:chat_app/components/customeColors.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  const MyTextField(
      {super.key, required this.hintText, required this.obscureText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide:
               const   BorderSide(color: CustomeColors.textFieldbg),
                  borderRadius: BorderRadius.circular(30)
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
              const    BorderSide(color: CustomeColors.scaffoldBg),
                  borderRadius: BorderRadius.circular(20)
            ),
            fillColor: CustomeColors.whiteSEcondary,
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.black)),
      ),
    );
  }
}
