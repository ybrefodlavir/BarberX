import 'package:barber/pages/welcome_page.dart';
//import 'dart.js';
import 'package:barber/pages/signin_page.dart';
import 'package:barber/pages/signup_page.dart';
import 'package:barber/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/signin',
    routes: {
      '/': (context) => WelcomePage(),
      '/signin': (context) => SignIn(),
      '/signup': (context) => SignUp(),
      '/home': (context) => Home(),
    },
  ));
}
