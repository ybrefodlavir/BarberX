import 'dart:convert';
import 'dart:ui';
import 'package:barber/models/reservation.dart';
import 'package:barber/providers/AuthProvider.dart';
import 'package:barber/providers/ReservationProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Akun extends StatefulWidget {
  const Akun({Key? key}) : super(key: key);

  @override
  State<Akun> createState() => _AkunState();
}

class _AkunState extends State<Akun> {
  var userData;
  bool noReservations = false;
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
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ReservationProvider>(context);
    List<Reservation> reservations = provider.reservations;
    provider.init();
    if (reservations.isEmpty) {
      setState(() {
        noReservations = false;
      });
    } else {
      setState(() {
        noReservations = true;
      });
    }
    return Scaffold(
        backgroundColor: Color(0xffffffff),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              top: 76,
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'images/profile.png',
                      height: 63,
                      width: 63,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: 24,
                            ),
                            child: Text(
                              userData != null
                                  ? '${userData['username']}'
                                  : 'username',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 24,
                            ),
                            child: Text(
                              userData != null
                                  ? '${userData['email']}'
                                  : 'example@gmail.com',
                              style: TextStyle(
                                color: Color(0xff8D8A8A),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 29),
                  color: Color(0xffD0D0D0),
                  width: double.infinity,
                  height: 2,
                ),
                Container(
                  margin: EdgeInsets.only(top: 27),
                  child: Text(
                    "Informasi Akun",
                    style: TextStyle(
                      color: Color(0xffA78849),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 21),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 175,
                            child: Text(
                              "Username",
                              style: TextStyle(
                                color: Color(0xff8D8A8A),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 9),
                            width: 175,
                            child: Text(
                              userData != null
                                  ? '${userData['username']}'
                                  : 'username',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 19,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            child: Text(
                              "Password",
                              style: TextStyle(
                                color: Color(0xff8D8A8A),
                              ),
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Image.asset(
                                  'images/editpassword.png',
                                  height: 20,
                                  width: 20,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/changepassword');
                                  },
                                  child: Text(
                                    "Edit Password",
                                    style: TextStyle(
                                      color: Color(0xffA78849),
                                      fontSize: 14,
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
                Container(
                  margin: EdgeInsets.only(top: 29),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 175,
                            child: Text(
                              "Email",
                              style: TextStyle(
                                color: Color(0xff8D8A8A),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 9),
                            width: 175,
                            child: Text(
                              userData != null
                                  ? '${userData['email']}'
                                  : 'example@gmail.com',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 19,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            child: Text(
                              "Telepon",
                              style: TextStyle(
                                color: Color(0xff8D8A8A),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 9),
                            width: 150,
                            child: Text(
                              userData != null
                                  ? '${userData['phone']}'
                                  : 'telepon',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 53,
                  margin: EdgeInsets.only(top: 65),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff1D2434),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/editakun');
                    },
                    child: Text(
                      "Ubah Data Akun",
                    ),
                  ),
                ),
                Container(
                  height: 53,
                  margin: EdgeInsets.only(top: 23),
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
                    onPressed: () {
                      logout();
                    },
                    child: Text(
                      "Log Out",
                      style: TextStyle(
                        color: Color(0xff1D2434),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 28),
                  color: Color(0xffD0D0D0),
                  width: double.infinity,
                  height: 2,
                ),
                Container(
                  margin: EdgeInsets.only(top: 28),
                  child: Text(
                    "Riwayat Transaksi",
                    style: TextStyle(
                      color: Color(0xffA78849),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                noReservations
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                            child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: reservations.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xffF7F7F7),
                                    ),
                                    margin: EdgeInsets.only(top: 21),
                                    height: 150,
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Reservasi Code : " +
                                              reservations[index]
                                                  .reservation_code,
                                          style: TextStyle(
                                            color: Color(0xff35415D),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 18),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Tanggal Reservasi",
                                                style: TextStyle(
                                                  color: Color(0xff898787),
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Text(
                                                formatDate(reservations[index]
                                                    .reservation_time),
                                                style: TextStyle(
                                                  color: Color(0xff000000),
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 12),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Total Harga",
                                                style: TextStyle(
                                                  color: Color(0xff898787),
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Text(
                                                "Rp. " +
                                                    reservations[index]
                                                        .price
                                                        .toString() +
                                                    " ,-",
                                                style: TextStyle(
                                                  color: Color(0xff000000),
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 12),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Status",
                                                style: TextStyle(
                                                  color: Color(0xff898787),
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    24, 5, 24, 5),
                                                decoration: BoxDecoration(
                                                  color: reservations[index]
                                                              .status ==
                                                          0
                                                      ? Color(0xffFFDAAF)
                                                      : Color(0xffCDFFAF),
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                                child: Text(
                                                  reservations[index].status ==
                                                          0
                                                      ? "Menunggu Customer"
                                                      : "Selesai",
                                                  style: TextStyle(
                                                    color: reservations[index]
                                                                .status ==
                                                            0
                                                        ? Color(0xffCE8938)
                                                        : Color(0xff128817),
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ],
                      )
                    : Container(
                        margin: EdgeInsets.only(top: 12),
                        child: const Center(
                          child: Text(
                              "Sepertinya Anda belum punya reservasi di BarberX, tunggu apa lagi. Anda bisa menjadi lebih bergaya jika Anda membuat reservasi."),
                        ),
                      )
              ],
            ),
          ),
        ));
  }

  String formatDate(date) {
    DateTime reservationDate = DateTime.parse(date);
    String formattedDate =
        DateFormat('dd MMMM yyyy – kk:mm').format(reservationDate);
    return formattedDate;
  }

  Future<void> logout() async {
    final AuthProvider provider =
        Provider.of<AuthProvider>(context, listen: false);

    await provider.logOut();
    Navigator.pushNamed(context, '/');
  }
}
