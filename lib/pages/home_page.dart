import 'dart:convert';
import 'dart:ui';
import 'package:barber/models/services.dart';
import 'package:barber/providers/AuthProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var userData;

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
    final provider = Provider.of<AuthProvider>(context);
    List<Service> services = provider.services;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(50)),
                color: Color(0xff1D2434),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 26, right: 284),
                    child: Image.asset(
                      'images/logo.png',
                      width: 110,
                      height: 34,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 29, 150, 9),
                    child: Text(
                      userData != null
                          ? 'Halo ${userData['name']}'
                          : 'Halo user',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 139, bottom: 39),
                    child: Text(
                      "Sudah potong rambutkah hari ini?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 45),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xffF6F6F7),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 13, right: 32),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Trusted Barbershop",
                          style: TextStyle(
                            color: Color(0xff35415D),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: 10, right: 32, bottom: 20, top: 3),
                        child: Text(
                          "It's 2021 bro, don't forget to trim your hair to make it trendy!",
                          style: TextStyle(
                            color: Color(0xff35415D),
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    "8:00 - 9:00",
                                    style: TextStyle(
                                      color: Color(0xff35415D),
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Opening Hour Mon - Fri",
                                    style: TextStyle(
                                      color: Color(0xff35415D),
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  child: Text(
                                    "+123 456 7890",
                                    style: TextStyle(
                                      color: Color(0xff35415D),
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Call Us for Appointment",
                                    style: TextStyle(
                                      color: Color(0xff35415D),
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 335, top: 10, right: 9),
                  child: Image.asset(
                    'images/logoBX.png',
                    width: 70,
                    height: 70,
                  ),
                ),
              ],
            ),
            Container(
              margin:
                  EdgeInsets.only(left: 10, top: 30, right: 300, bottom: 15),
              child: Text(
                "Services",
                style: TextStyle(
                  color: Color(0xff35415D),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 180,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    Service service = services[index];
                    return Container(
                      width: 130,
                      margin: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5)),
                        color: Color(0xff35415D),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(left: 15, top: 15, right: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5)),
                              color: Color(0xffDFC38A),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 5, top: 5, right: 5),
                                  child: Image.asset(
                                    service.image,
                                    width: 90,
                                    height: 90,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 13, bottom: 9),
                                  alignment: Alignment.center,
                                  child: Text(
                                    service.name,
                                    style: TextStyle(
                                      color: Color(0xff35415D),
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5, bottom: 7),
                            alignment: Alignment.center,
                            child: Text(
                              'Rp ' + service.price.toString() + ',-',
                              style: TextStyle(
                                color: Color(0xffF7D99F),
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 30, right: 194),
              child: Text(
                'Where to find us?',
                style: TextStyle(
                  color: Color(0xff35415D),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/akun');
                },
                child: Text(
                  "Ke Akun",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
