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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final idController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  String errorMessage = '';
  String successMessage = '';
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
    idController.text = userData['user_id'].toString();
    usernameController.text = userData['username'];
    emailController.text = userData['email'];
    phoneController.text = userData['phone'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  fontSize: 16,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.only(top: 9, left: 20),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffCDFFAF),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        successMessage,
                        style: TextStyle(
                          color: Color(0xff128817),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red[100],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        errorMessage,
                        style: TextStyle(
                          color: Colors.red[900],
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 18, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 3),
                    child: Text(
                      'Username',
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
                      controller: usernameController,
                      validator: (String? value) {
                        if (value!.trim().isEmpty) {
                          return 'Masukkan username Anda';
                        }
                        return null;
                      },
                      onChanged: (text) => setState(() => errorMessage = ''),
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: 'Masukkan Username Anda',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            'images/vector.png',
                            width: 17,
                            height: 16.46,
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
              margin: EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 3),
                    child: Text(
                      'Email',
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
                      controller: emailController,
                      validator: (String? value) {
                        if (value!.trim().isEmpty) {
                          return 'Masukkan Email Anda';
                        }
                        return null;
                      },
                      onChanged: (text) => setState(() => errorMessage = ''),
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: 'Masukkan Email Anda',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            'images/vecemail.png',
                            width: 20,
                            height: 20,
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
              margin: EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 3),
                    child: Text(
                      'Telepon',
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
                      controller: phoneController,
                      validator: (String? value) {
                        if (value!.trim().isEmpty) {
                          return 'Masukkan Telepon Anda';
                        }

                        return null;
                      },
                      onChanged: (text) => setState(() => errorMessage = ''),
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: 'Masukkan Telepon Anda',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            'images/el_phone.png',
                            width: 20,
                            height: 20,
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
              margin: EdgeInsets.only(top: 150, left: 20, right: 20),
              width: 373,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff1D2434),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {
                  submit();
                },
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
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
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
      ),
    );
  }

  Future<void> submit() async {
    final form = _formKey.currentState;

    if (!form!.validate()) {
      return;
    }
    final AuthProvider provider =
        Provider.of<AuthProvider>(context, listen: false);
    try {
      await provider.postDataAkun(
        int.parse(idController.text),
        usernameController.text,
        emailController.text,
        phoneController.text,
      );
      setState(() {
        successMessage = 'Akun telah diperbarui! Klik kembali';
      });
    } catch (Exception) {
      setState(() {
        errorMessage = Exception.toString().replaceAll('Exception: ', '');
      });
    }
  }
}
