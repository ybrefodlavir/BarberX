import 'dart:convert';
import 'package:barber/pages/akun_page.dart';
import 'package:barber/pages/homeMain.dart';
import 'package:barber/pages/reservasi_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  List widgetOptions = [const HomeMain(), const Reservasi(), const Akun()];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var toPage = ModalRoute.of(context)!.settings.arguments;
    if (toPage == 2) {
      setState(() {
        selectedIndex = 2;
      });
      toPage = 0;
    }
    return Scaffold(
      body: widgetOptions.elementAt(selectedIndex),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text("Reservasi"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Akun"),
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }

  Future<void> onItemTapped(int index) async {
    setState(() {
      selectedIndex = index;
      print(selectedIndex);
    });
  }
}
