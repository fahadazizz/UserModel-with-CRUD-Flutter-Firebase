import 'package:flutter_todo/UI/SignUp.dart';
import 'package:flutter_todo/UI/home.dart';
import 'package:flutter_todo/UI/signIn.dart';
import 'package:get/get.dart';

class FlutterRoutes {
  static final String signIn = '/signIn';
  static final String signUp = '/signUp';
  static final String home = '/home';

  static final List<GetPage> route = [
    GetPage(name: signIn, page: () => SignInPage()),
    GetPage(name: signUp, page: () => SignUpPage()),
  ];
}
