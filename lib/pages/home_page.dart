import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor : Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children:[
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
                  color: Color(0xff1D2434),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left:20, top:26, right: 284),
                      child: Image.asset(
                        'image/logo.png',
                        width: 110,
                        height: 34,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 29, 150, 9),
                      child: Text(
                        "Halo Rivaldo,",
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
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 45),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xffF6F6F7),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 32),
                          child: Text(
                            "Trusted Barbershop",
                            style: TextStyle(
                              color: Color(0xff35415D),
                              fontSize: 23,
                            ),
                          ),
                        ),
                        Container(
                          child: Image.asset(
                            'image/logoBX.png',
                            width: 70,
                            height: 70,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 32, bottom: 20),
                      child: Text(
                        "It's 2021 bro, don't forget to trim your hair to make it trendy!",
                        style: TextStyle(
                          color: Color(0xff35415D),
                          fontSize: 23,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            children: [
                              Container(          
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "8:00 - 9:00",
                                    style: TextStyle(
                                      color: Color(0xff35415D),
                                      fontSize: 15,
                                    ),
                                  ),                              
                              ),
                              Container(         
                                  alignment: Alignment.centerLeft,
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
                          margin: EdgeInsets.only(right: 10, left: 32),
                          child: Column(
                            children: [
                              Container(                    
                                alignment: Alignment.centerRight,         
                                  child: Text(
                                    "+123 456 7890",
                                    style: TextStyle(
                                      color: Color(0xff35415D),
                                      fontSize: 15,
                                    ),
                                  ),                               
                              ),
                              Container(                             
                                  alignment: Alignment.centerRight,
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
            ],
          ),
        ),
      ),
    );
  }
}