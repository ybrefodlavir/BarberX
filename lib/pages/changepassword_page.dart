import 'dart:convert';
import 'dart:ui';
import 'package:barber/models/services.dart';
import 'package:barber/providers/AuthProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, top: 70, right: 211),
              child: Text(
                'Ubah Password',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 21, top: 10, right: 20),
              child: Text(
                'Pastikan Anda memasukkan password yang berbeda dari sebelumnya',
                style: TextStyle(
                  color: Color(0xffA78849),
                  fontSize: 13,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 45, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 3),
                    child: Text(
                      'Password Baru',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    width: 374,
                    child: TextFormField(
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: 'Masukkan Password Baru',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            'images/carbon_password.png',
                            width: 17,
                            height: 17,
                            fit: BoxFit.fill,
                          ),
                        ),
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide:
                              BorderSide(color: Color(0xffDAD7D2), width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                          borderSide:
                              BorderSide(color: Color(0xffDAD7D2), width: 2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 17, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 3),
                    child: Text(
                      'Konfirmasi Password Baru',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    width: 374,
                    child: TextFormField(
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: 'Konfirmasi Password Baru',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            'images/carbon_password.png',
                            width: 17,
                            height: 17,
                            fit: BoxFit.fill,
                          ),
                        ),
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide:
                              BorderSide(color: Color(0xffDAD7D2), width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                          borderSide:
                              BorderSide(color: Color(0xffDAD7D2), width: 2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                  height: 53,
                  margin: EdgeInsets.only(top: 220, left: 20, right: 20),
                  width: 373,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff1D2434),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Simpan",
                    ),
                  ),
             ),
             Container(
                  height: 53,
                  margin: EdgeInsets.only(top: 14, left: 20, right: 20),
                  width: 373,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      side: BorderSide(
                        color: Color(0xff1D2434),
                        width: 1,
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Kembali",
                      style: TextStyle(
                        color: Color(0xff1D2434),
                      ),
                    ),
                  ),
                ),
          ],
        ),
      )
    );
  }
}