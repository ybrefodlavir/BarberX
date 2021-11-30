// import 'dart:ffi';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1D2434),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 90),
          width: double.infinity,
          child: Center(
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
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
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
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
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
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 60,
                  width: 364,
                  color: Color(0xff35415D),
                  child: Row(
                    children: [
                      Image.asset(
                        'image/email.png',
                        width: 30,
                        height: 30,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 15, right: 10),
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
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
                              hintText: "Email",
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
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 60,
                  width: 364,
                  color: Color(0xff35415D),
                  child: Row(
                    children: [
                      Image.asset(
                        'image/phone.png',
                        width: 30,
                        height: 30,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 15, right: 10),
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
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
                              hintText: "Phone",
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
                  height: 15,
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
                          child: TextField(
                            obscureText: true,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
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
                  height: 15,
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
                          child: TextField(
                            obscureText: true,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
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
                              hintText: "Confirm Password",
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
                  height: 30,
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
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Text(
                      "Sign Up",
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
                        "You have an account?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signin');
                        },
                        child: Text(
                          "Sign In",
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
    );
  }
}
