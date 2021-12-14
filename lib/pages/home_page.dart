import 'dart:convert';
import 'package:barber/models/services.dart';
import 'package:barber/pages/akun_page.dart';
import 'package:barber/pages/homeMain.dart';
import 'package:barber/pages/reservasi_page.dart';
import 'package:barber/providers/AuthProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var userData;
  int selectedIndex = 0;
  List widgetOptions = [HomeMain(), Reservasi(), Akun()];

  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }

  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('token');
    var user = json.decode(userJson!);

    setState(() {
      userData = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff1D2434),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/home.png"),
              color: Colors.white,
            ),
            title: Text(
              "Home",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
              ),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/reservasi.png"),
            ),
            title: Text(
              "Reservasi",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
              ),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/user.png"),
              color: Colors.white,
            ),
            title: Text(
              "Akun",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
              ),
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
    });
  }
}
