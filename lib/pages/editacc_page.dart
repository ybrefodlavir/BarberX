import 'dart:convert';
import 'dart:ui';
import 'package:barber/models/services.dart';
import 'package:barber/providers/AuthProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditAcc extends StatefulWidget {
  const EditAcc({Key? key}) : super(key: key);

  @override
  State<EditAcc> createState() => _EditAccState();
}

class _EditAccState extends State<EditAcc> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 70, left: 20),
              child: Text(
                'Ubah Data Akun',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 9, left: 20),
              child: Text(
                'Pastikan anda memasukkan data yang benar dan valid!',
                style: TextStyle(
                  color: Color(0xffA78849),
                  fontSize: 13,
                ),
              ),
            ),
            Container(
              
            ),
          ],
        ),
      ),
    );
  }
}