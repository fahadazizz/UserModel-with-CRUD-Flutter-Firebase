import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/Components/snackbar.dart';
import 'package:flutter_todo/Model/firestore.dart';
import 'package:flutter_todo/Model/userModel.dart';
import 'package:flutter_todo/UI/home.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:uuid/uuid.dart';

import '../Components/button.dart';
import '../Components/textButton.dart';
import '../Components/textForm.dart';
import '../route.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final fullnameController = TextEditingController();

  final usernameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final genderController = TextEditingController();

  final key = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  FireStoreService _service = FireStoreService();

  void storeData(BuildContext context) async {
    String uid = Uuid().v4();

    UserModel user = UserModel(
      uid: uid,
      fullName: fullnameController.text,
      userName: usernameController.text,
      Gender: genderController.text,
      email: emailController.text,
    );

    await _service.storeDate(user);

    DoneSnackBar();

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => HomePage(
                uid: uid,
              )),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Create Account"),
      ),
      body: Center(
        child: Form(
          key: key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormFieldInput(
                text: "Enter Full Name",
                controller: fullnameController,
                icon: Icon(Icons.person),
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
                text: "Enter Username",
                controller: usernameController,
                icon: Icon(Icons.person),
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
                text: "Enter Gender",
                controller: genderController,
                icon: Icon(Icons.person),
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
                height: 30,
              ),
              ButtonFirst(
                  text: "Sign Up",
                  onPres: () {
                    if (key.currentState!.validate()) {
                      _auth
                          .createUserWithEmailAndPassword(
                              email: emailController.text.toString(),
                              password: passwordController.text.toString())
                          .then((value) => {DoneSnackBar()})
                          .onError((error, stackTrace) => {
                      });
                    }
                    storeData(context);

                    setState(() {
                      emailController.clear();
                      usernameController.clear();
                      fullnameController.clear();
                      genderController.clear();
                      passwordController.clear();
                      FocusScope.of(context).unfocus();
                    });
                  }),
              const SizedBox(
                height: 20,
              ),
              ButtonSecond(
                  text: "Already have Account Sign In",
                  onPress: () {
                    Get.toNamed(FlutterRoutes.home);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
