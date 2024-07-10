import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/route.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  FirebaseAuth _auth = FirebaseAuth.instance;
  void initState() {
    final User = _auth.currentUser;
    if (User == null) {
      Timer(Duration(seconds: 4), () {
        Get.toNamed(FlutterRoutes.signIn);
      });
    } else {
      Timer(Duration(seconds: 4), () {
        Get.toNamed(FlutterRoutes.home);
      });
    }

    super.initState();
  }

  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
