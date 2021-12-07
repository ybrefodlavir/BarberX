import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Reservasi extends StatefulWidget {
  const Reservasi({Key? key}) : super(key: key);

  @override
  State<Reservasi> createState() => _ReservasiState();
}

class _ReservasiState extends State<Reservasi> {
  bool status = false;

  Map<String, bool> even = {
    'Wedding Haircut\nRp 30.000,-': false,
    'Shampoo\nRp 30.000,-': false,
    'Curly\nRp 30.000,-': true,
    'Hair Wash\nRp 30.000,-': false,
  };
  Map<String, bool> odd = {
    'Hair Cut\nRp 20.000,-': false,
    'Bread Shave\nRp 20.000,-': false,
    'Bread Trim\nRp 90.000,-': false,
    'Coloring\nRp 60.000,-': true,
  };
  var holder_1 = [];
  getItems() {
    even.forEach((key, value) {
      if (value == true) {
        holder_1.add(key);
      }
    });
    odd.forEach((key, value) {
      if (value == true) {
        holder_1.add(key);
      }
    });
    print(holder_1);
    holder_1.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  "Buat Reservasi Baru",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 20),
                child: Text(
                  "Buat diri anda lebih bergaya dengan gaya rambut baru",
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xffA78849),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 28,
                  left: 20,
                ),
                child: Text(
                  "Layanan Potong Rambut",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 20,
                ),
                child: Row(
                  children: [
                    Container(
                      child: Expanded(
                        child: Column(
                          children: even.keys.map((String key) {
                            return CheckboxListTile(
                              title: new Text(key),
                              value: even[key],
                              activeColor: Color(0xffD5B981),
                              checkColor: Color(0xff1D2434),
                              onChanged: (value) {
                                setState(() {
                                  even[key] = value!;
                                  getItems();
                                });
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Container(
                      child: Expanded(
                        child: Column(
                          children: odd.keys.map((String key) {
                            return CheckboxListTile(
                              title: new Text(key),
                              value: odd[key],
                              activeColor: Color(0xffD5B981),
                              checkColor: Color(0xff1D2434),
                              onChanged: (value) {
                                setState(() {
                                  odd[key] = value!;
                                  getItems();
                                });
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 39, left: 20),
                child: Text(
                  "Tanggal Reservasi",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Color(0xffCDD4E2),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.only(left: 20, top: 14, right: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 60,
                width: 364,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: TextField(
                          obscureText: true,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            hintText: "hh/bb/tttt",
                            hintStyle: TextStyle(
                              color: Color(0xff616670),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Image.asset(
                      'image/calendar.png',
                      width: 30,
                      height: 30,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 26, left: 20, right: 20),
                color: Color(0xffD0D0D0),
                width: double.infinity,
                height: 1,
              ),
              Container(
                margin: EdgeInsets.only(top: 33, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Total Harga",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff434343),
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Rp 90.000,-",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 49),
                child: Text(
                    "*Anda bisa membatalkan reservasi Anda di halaman riwayat reservasi"),
              ),
              Container(
                height: 53,
                margin: EdgeInsets.only(top: 14, right: 20, left: 20),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff1D2434),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Buat Reservasi",
                  ),
                ),
              ),
              Container(
                height: 53,
                margin: EdgeInsets.only(
                  top: 14,
                  right: 20,
                  left: 20,
                  bottom: 53,
                ),
                width: double.infinity,
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
        ),
      ),
    );
  }
}
