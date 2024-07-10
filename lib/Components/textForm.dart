import 'package:flutter/material.dart';

class FormFieldInput extends StatelessWidget {
  @override
  final String? Function(String?) validator;
  String text;
  final Icon icon;
  final bool obs;
  final TextEditingController controller;

  FormFieldInput({
    required this.text,
    required this.icon,
    required this.validator,
    required this.obs,
    required this.controller,
  });
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: 280,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: text,
          prefixIcon: icon,
        ),
        obscureText: obs,
        validator: validator,
      ),
    );
  }
}
