import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/Components/button.dart';
import 'package:flutter_todo/Components/snackbar.dart';
import 'package:flutter_todo/Components/textButton.dart';
import 'package:flutter_todo/Components/textForm.dart';
import 'package:flutter_todo/route.dart';
import 'package:get/get.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final key = GlobalKey<FormState>();

  FirebaseAuth _auth = FirebaseAuth.instance;
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Welcome back"),
      ),
      body: Center(
        child: Form(
          key: key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormFieldInput(
                text: "Enter Email",
                controller: emailController,
                icon: Icon(Icons.email),
                obs: false,
                validator: (value) {
                  if (value!.isEmpty) {}
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              FormFieldInput(
                text: "Enter Password",
                controller: passwordController,
                icon: Icon(Icons.password),
                obs: true,
                validator: (value) {
                  if (value!.isEmpty) {}
                  return null;
                },
              ),
              const SizedBox(
                height: 25,
              ),
              ButtonFirst(
                  text: "Login",
                  onPres: () {
                    if (key.currentState!.validate()) {
                      _auth
                          .signInWithEmailAndPassword(
                              email: emailController.text.toString(),
                              password: passwordController.text.toString())
                          .then((value) => {
                                DoneSnackBar().done(),
                                Get.toNamed(FlutterRoutes.home),
                              })
                          .onError((error, stackTrace) => {
                                ErrorSnackBar().done(),
                              });
                    }
                    setState(() {
                      emailController.clear();
                      passwordController.clear();
                      FocusScope.of(context).unfocus();
                    });
                  }),
              const SizedBox(
                height: 20,
              ),
              ButtonSecond(
                  text: "Don't have Account Sign Up",
                  onPress: () {
                    Get.toNamed(FlutterRoutes.signUp);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
