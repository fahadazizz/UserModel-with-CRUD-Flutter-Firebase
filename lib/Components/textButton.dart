import 'package:flutter/material.dart';

class ButtonSecond extends StatelessWidget {
  final VoidCallback onPress;
  String text;
  ButtonSecond({required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPress,
        child: Text(
          text,
          style: TextStyle(color: Colors.black),
        ));
  }
}
