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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff1D2434),
        items: const <BottomNavigationBarItem>[
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
            icon: Positioned(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.0, 0.5, 1.0],
                        colors: <Color>[
                          Color(0xffD5B981),
                          Color(0xffFFE1A6),
                          Color(0xffD5B981)
                        ],
                      ),
                ),
                height: 70,
                width: 70,
                child: Center(
                  child: Image.asset(
                    'images/fe_plus.png',
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
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
      print(selectedIndex);
    });
  }
}
