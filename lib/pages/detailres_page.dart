import 'dart:convert';
import 'dart:html';
import 'dart:ui';
import 'package:barber/models/reservationDetails.dart';
import 'package:barber/providers/ReservationProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DetailReservation extends StatefulWidget {
  const DetailReservation({Key? key}) : super(key: key);

  @override
  State<DetailReservation> createState() => _DetailReservationState();
}

class _DetailReservationState extends State<DetailReservation> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ReservationProvider>(context);
    List<ReservationDetails> reservationDetails = provider.reservationDetails;
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
                'Reservasi Code : ' + reservationDetails[0].reservation_code,
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
                    formatDate(reservationDetails[0].reservation_time),
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
                    "Rp. " +
                        reservationDetails[0].totalPrice.toString() +
                        " ,-",
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
                      color: reservationDetails[0].status == 0
                          ? Color(0xffFFDAAF)
                          : Color(0xffCDFFAF),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      reservationDetails[0].status == 0
                          ? "Menunggu Customer"
                          : "Selesai",
                      style: TextStyle(
                        color: reservationDetails[0].status == 0
                            ? Color(0xffCE8938)
                            : Color(0xff128817),
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
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: reservationDetails.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(left: 20, top: 19, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                reservationDetails[index].service,
                                style: TextStyle(
                                  color: Color(0xff898787),
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "Rp. " +
                                    reservationDetails[index]
                                        .servicePrice
                                        .toString() +
                                    " ,-",
                                style: TextStyle(
                                  color: Color(0xff000000),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
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
                  Navigator.pop(context);
                },
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
                  reservationDetails[0].status == 0
                      ? "Batalkan Reservasi"
                      : "Hapus",
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

  String formatDate(date) {
    DateTime reservationDate = DateTime.parse(date);
    String formattedDate =
        DateFormat('dd MMMM yyyy – kk:mm').format(reservationDate);
    return formattedDate;
  }
}
