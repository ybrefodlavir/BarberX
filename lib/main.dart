import 'package:barber/pages/welcome_page.dart';
import 'package:barber/pages/signin_page.dart';
import 'package:barber/pages/signup_page.dart';
import 'package:barber/pages/home_page.dart';
import 'package:barber/providers/AuthProvider.dart';
import 'package:barber/providers/ServiceProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(title: 'Welcome to BarberX', routes: {
        '/': (context) {
          final authProvider = Provider.of<AuthProvider>(context);
          if (authProvider.isAuthenticated) {
            return Home();
          } else {
            return WelcomePage();
          }
        },
        '/signin': (context) => SignIn(),
        '/signup': (context) => SignUp(),
        '/home': (context) => Home(),
      }),
    );
  }
}
