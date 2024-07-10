import 'package:flutter/material.dart';

class ButtonFirst extends StatelessWidget {
  final VoidCallback onPres;
  String text;
  ButtonFirst({required this.text, required this.onPres});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.purple.withOpacity(0.7),
            foregroundColor: Colors.white),
        onPressed: onPres,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
