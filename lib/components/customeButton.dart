import 'package:chat_app/components/customeColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class My_Button extends StatelessWidget {
  
  final void Function()? onPress;
  final String text;
  
  const My_Button({super.key, required this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPress,
      child: Container(
        decoration: BoxDecoration(
            color: CustomeColors.hintDark,
            borderRadius: BorderRadius.circular(40)),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 85),
        child: Center(
          child: Text(text, style: TextStyle(color: CustomeColors.whitePrimery),),
        ),
      ),
    );
  }
}
