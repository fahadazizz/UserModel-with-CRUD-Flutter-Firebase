import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DoneSnackBar {
  Future<SnackbarController> done() async {
    return Get.snackbar(
      'Hy Friend',
      'Account Created Successfully',
      duration: Duration(seconds: 2), // D// uration of the snackbar display
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor:
          Colors.green.shade600, // Background color of the snackbar
      colorText: Colors.white, // Text color of the message
      borderRadius: 10, // Border radius of the snackbar
      margin: EdgeInsets.all(20), // Margin around the snackbar
    );
  }
}

class ErrorSnackBar {
  Future<SnackbarController> done() async {
    return Get.snackbar(
      'Hy Friend',
      'An error occurred while creating Account',
      duration: Duration(seconds: 2), // D// uration of the snackbar display
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.shade600, // Background color of the snackbar
      colorText: Colors.white, // Text color of the message
      borderRadius: 10, // Border radius of the snackbar
      margin: EdgeInsets.all(20), // Margin around the snackbar
    );
  }
}
