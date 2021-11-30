import 'package:barber/pages/welcome_page.dart';
import 'package:barber/pages/signin_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => WelcomePage(),
      '/signin': (context) => SignIn(),
    },
  ));
}
