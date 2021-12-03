import 'dart:ui';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:barber/providers/AuthProvider.dart';
import 'package:provider/provider.dart';
import 'package:device_info/device_info.dart';

class SignIn extends StatefulWidget {
  const SignIn();

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  String errorMessage = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1D2434),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 90),
          width: double.infinity,
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'image/logo.png',
                    width: 224,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    height: 30,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.0, 0.5, 1.0],
                        colors: <Color>[
                          Color(0xff1D2434),
                          Color(0xff3F4D6C),
                          Color(0xff1D2434)
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(errorMessage, style: TextStyle(color: Colors.red[200])),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 60,
                    width: 364,
                    color: Color(0xff35415D),
                    child: Row(
                      children: [
                        Image.asset(
                          'image/username.png',
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 15, right: 10),
                            // Username
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              controller: loginController,
                              validator: (String? value) {
                                // Validation condition
                                if (value!.trim().isEmpty) {
                                  return 'Please enter username or email';
                                }
                                return null;
                              },
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                errorStyle: TextStyle(color: Colors.red[200]),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffA39270)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffA39270)),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffA39270)),
                                ),
                                contentPadding:
                                    EdgeInsets.only(left: 5.0, bottom: -10),
                                hintText: "Username or Email",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffA39270),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 60,
                    width: 364,
                    color: Color(0xff35415D),
                    child: Row(
                      children: [
                        Image.asset(
                          'image/password.png',
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 15, right: 10),
                            // Password
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: passwordController,
                              obscureText: true,
                              autocorrect: false,
                              enableSuggestions: false,
                              validator: (String? value) {
                                // Validation condition
                                if (value!.isEmpty) {
                                  return 'Please enter password';
                                }
                                return null;
                              },
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                errorStyle: TextStyle(color: Colors.red[200]),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xffA39270),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffA39270)),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffA39270)),
                                ),
                                contentPadding:
                                    EdgeInsets.only(left: 5.0, bottom: -10),
                                hintText: "Password",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffA39270),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
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
                    child: ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(300, 50)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        submit();
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xff1D2434),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Text(
                          "You don't have an account?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Color(0xffD5B981),
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
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
      await provider.login(loginController.text, passwordController.text);
      Navigator.pop(context);
    } catch (Exception) {
      setState(() {
        errorMessage = Exception.toString().replaceAll('Exception: ', '');
      });
    }
  }
}
