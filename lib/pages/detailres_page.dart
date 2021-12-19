import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class DetailReservation extends StatefulWidget {
  const DetailReservation({Key? key}) : super(key: key);

  @override
  State<DetailReservation> createState() => _DetailReservationState();
}

class _DetailReservationState extends State<DetailReservation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 21, top: 69, right: 203),
              child: Text(
                'Detail Reservasi',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 21, top: 19, right: 128),
              child: Text(
                'Reservasi Code : #RBX-YbzIMopZ',
                style: TextStyle(
                  color: Color(0xffA78849),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 21, top: 21, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tanggal Reservasi",
                    style: TextStyle(
                      color: Color(0xff898787),
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "11 Oktober 2021",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 21, top: 12, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Harga",
                    style: TextStyle(
                      color: Color(0xff898787),
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Rp. 90.000,-",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 21, top: 12, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Status",
                    style: TextStyle(
                      color: Color(0xff898787),
                      fontSize: 14,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(24, 5, 24, 5),
                    decoration: BoxDecoration(
                      color: Color(0xffFFDAAF),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      "Menunggu Customer",
                      style: TextStyle(
                        color: Color(0xffCE8938),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 32, right: 20),
              width: 374,
              height: 1,
              color: Color(0xffD0D0D0),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 20, top: 25),
              child: Text(
                'Rincian Layanan',
                style: TextStyle(
                  color: Color(0xff1D2434),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 19, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Haircut",
                    style: TextStyle(
                      color: Color(0xff898787),
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Rp. 60.000,-",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 19, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shampoo",
                    style: TextStyle(
                      color: Color(0xff898787),
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Rp. 30.000,-",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 53,
              margin: EdgeInsets.only(top: 207, left: 20, right: 20),
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
                  "Kembali",
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
                  "Batalkan Reservasi",
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
}
