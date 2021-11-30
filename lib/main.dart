import 'package:barber/pages/welcome_page.dart';
//import 'dart.js';
import 'package:barber/pages/signin_page.dart';
import 'package:barber/pages/signup_page.dart';
import 'package:barber/pages/home_page.dart';
import 'package:barber/providers/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

<<<<<<< HEAD
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
=======
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AuthProvider(),
        child: Consumer<AuthProvider>(builder: (context, authProvider, child) {
          return MultiProvider(
              providers: [
                // ChangeNotifierProvider<CategoryProvider>(
                //     create: (context) => CategoryProvider(authProvider)),
                // ChangeNotifierProvider<TransactionProvider>(
                //     create: (context) => TransactionProvider(authProvider))
              ],
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
              }));
        }));
  }
>>>>>>> 068f2daf507f8443bec40c55ee74e6b9151417c6
}
