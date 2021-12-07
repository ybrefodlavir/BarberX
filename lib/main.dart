import 'package:barber/pages/akun_page.dart';
import 'package:barber/pages/reservasi_page.dart';
import 'package:barber/pages/welcome_page.dart';
// import 'dart.js';
import 'package:barber/pages/signin_page.dart';
import 'package:barber/pages/signup_page.dart';
import 'package:barber/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/reservasi',
    routes: {
      '/': (context) => WelcomePage(),
      '/signin': (context) => SignIn(),
      '/signup': (context) => SignUp(),
      '/home': (context) => Home(),
      '/reservasi': (context) => Reservasi(),
      '/akun': (context) => Akun(),
    },
  ));
}
