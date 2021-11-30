import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor : Color(0xff1D2434),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xff1D2434),
          child: Column(
            children: [
              Image.asset(
                'image/logo.png',
                width: 45,
              ),
              Text(
                "Halo Rivaldo,",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                ),
              ),
              Text(
                "Sudah potong rambutkah hari ini?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}