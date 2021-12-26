import 'package:barber/pages/akun_page.dart';
import 'package:barber/pages/detailres_page.dart';
import 'package:barber/pages/reservasi_page.dart';
import 'package:barber/pages/welcome_page.dart';
import 'package:barber/pages/signin_page.dart';
import 'package:barber/pages/signup_page.dart';
import 'package:barber/pages/home_page.dart';
import 'package:barber/pages/editacc_page.dart';
import 'package:barber/pages/changepassword_page.dart';
import 'package:barber/providers/AuthProvider.dart';
import 'package:barber/providers/ReservationProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AuthProvider(),
        child: Consumer<AuthProvider>(builder: (context, authProvider, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<ReservationProvider>(
                  create: (context) => ReservationProvider(authProvider)),
            ],
            child: MaterialApp(title: 'Welcome to BarberX', routes: {
              '/': (context) {
                final authProvider = Provider.of<AuthProvider>(context);
                if (authProvider.isAuthenticated) {
                  return const Home();
                } else {
                  return const WelcomePage();
                }
              },
              '/signin': (context) => const SignIn(),
              '/signup': (context) => SignUp(),
              '/home': (context) => const Home(),
              '/reservasi': (context) => const Reservasi(),
              '/akun': (context) => const Akun(),
              '/editakun': (context) => const EditAcc(),
              '/detailreservasi': (context) => const DetailReservation(),
              '/changepassword': (context) => const ChangePassword(),
            }),
          );
        }));
  }
}
