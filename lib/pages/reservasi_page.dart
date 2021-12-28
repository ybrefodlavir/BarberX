import 'dart:convert';
import 'dart:ui';
import 'package:barber/models/services.dart';
import 'package:barber/providers/ReservationProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class Reservasi extends StatefulWidget {
  const Reservasi({Key? key}) : super(key: key);

  @override
  State<Reservasi> createState() => _ReservasiState();
}

class _ReservasiState extends State<Reservasi> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  final reservasiDateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final idController = TextEditingController();
  String errorMessage = '';
  String successMessage = '';
  var userData;
  bool isLoading = false;
  List<Service> services = [];
  late Map<Service, bool> even = {};
  late Map<Service, bool> odd = {};
  Map<int, int> servicesList = {};
  late int totalPrice = 0;

  Future<void> getData() async {
    final prefs = await SharedPreferences.getInstance();
    var servicesJason = prefs.getString('sevices');
    var realServices = jsonDecode(servicesJason!);
    var userJson = prefs.getString('token');
    var user = json.decode(userJson!);
    setState(() {
      userData = user;
    });
    idController.text = userData['user_id'].toString();
    for (var i = 0; i < realServices.length; i++) {
      var firstrealServices = realServices[i];
      Service serviceObj = Service(
          serviceId: firstrealServices['service_id'],
          categoryServiceId: firstrealServices['category_service_id'],
          name: firstrealServices['name'].toString(),
          price: firstrealServices['price'],
          image: firstrealServices['image'].toString(),
          createdAt: firstrealServices['created_at'].toString(),
          updateAt: firstrealServices['updated_at'].toString());
      setState(() {
        services.add(serviceObj);
      });
    }
    setState(() {
      for (var i = 0; i < services.length; i++) {
        if (services[i].serviceId % 2 == 0) {
          even[services[i]] = false;
        } else {
          odd[services[i]] = false;
        }
      }
    });
  }

  getItems() {
    even.forEach((key, value) {
      if (value == true) {
        setState(() {
          servicesList[key.serviceId] = key.price;
        });
      } else if (value == false) {
        if (servicesList.containsKey(key.serviceId)) {
          servicesList.removeWhere((key1, value1) => key1 == key.serviceId);
        }
      }
    });
    odd.forEach((key, value) {
      if (value == true) {
        setState(() {
          servicesList[key.serviceId] = key.price;
        });
      } else if (value == false) {
        if (servicesList.containsKey(key.serviceId)) {
          servicesList.removeWhere((key1, value1) => key1 == key.serviceId);
        }
      }
    });
    if (servicesList.isNotEmpty) {
      var values = servicesList.values;
      setState(() {
        totalPrice = values.reduce((sum, element) => sum + element);
      });
    } else {
      setState(() {
        totalPrice = 0;
      });
    }
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
                margin: EdgeInsets.only(
                  top: 10,
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
                  top: 10,
                ),
                child: Row(
                  children: [
                    Container(
                      child: Expanded(
                        child: Column(
                          children: even.keys.map((Service key) {
                            return CheckboxListTile(
                              title: new Text(key.name +
                                  "\nRp." +
                                  key.price.toString() +
                                  ",-"),
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
                          children: odd.keys.map((Service key) {
                            return CheckboxListTile(
                              title: new Text(key.name +
                                  "\nRp." +
                                  key.price.toString() +
                                  ",-"),
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
                          controller: reservasiDateController,
                          onTap: () {
                            selectDate(context);
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            hintText: "TTTT-BB-HH JJ:MM:tt",
                            hintStyle: TextStyle(
                              color: Color(0xff616670),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        selectDate(context);
                      },
                      child: Image.asset(
                        'images/calendar.png',
                        width: 30,
                        height: 30,
                      ),
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
                        "Rp." + totalPrice.toString() + ",-",
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
                    primary: isLoading ? Color(0xffD5B981) : Color(0xff1D2434),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {
                    isLoading ? null : submit();
                  },
                  child: Text(
                    isLoading ? "Sedang Membuat ...." : "Buat Reservasi",
                    style: TextStyle(
                      color: isLoading ? Color(0xff1D2434) : Color(0xffD5B981),
                    ),
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
                  onPressed: () {
                    Navigator.pop(context);
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
      ),
    );
  }

  Future selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day),
        lastDate: DateTime(DateTime.now().year + 5));
    if (picked != null)
      setState(() {
        reservasiDateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    if (reservasiDateController.text.isNotEmpty) {
      selectTime(context);
    }
  }

  Future selectTime(BuildContext context) async {
    TimeOfDay selectedTime = const TimeOfDay(hour: 00, minute: 00);
    String _hour, _minute, _time;
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      selectedTime = picked;
      _hour = selectedTime.hour.toString();
      _minute = selectedTime.minute.toString();
      if (selectedTime.hour < 10) {
        _hour = '0' + _hour;
      }
      if (selectedTime.minute < 10) {
        _minute = '0' + _minute;
      }
      _time = _hour + ':' + _minute + ":00";
      setState(() {
        reservasiDateController.text += " " + _time;
      });
    } else {
      setState(() {
        reservasiDateController.text = "";
        errorMessage = 'Pilih Jam';
      });
    }
  }

  Future<void> submit() async {
    setState(() {
      errorMessage = '';
      successMessage = '';
    });
    final form = _formKey.currentState;

    if (!form!.validate()) {
      return;
    }
    if (!servicesList.isNotEmpty) {
      setState(() {
        errorMessage = "Pilih Layanan";
      });
      return;
    } else if (reservasiDateController.text.isEmpty) {
      setState(() {
        errorMessage = "Pilih Hari";
      });
      return;
    }
    setState(() {
      isLoading = true;
    });
    final ReservationProvider provider =
        Provider.of<ReservationProvider>(context, listen: false);
    try {
      bool valid = await provider.addReservation(
        int.parse(idController.text),
        servicesList,
        reservasiDateController.text,
      );
      if (valid == true) {
        setState(() {
          successMessage = 'Sudah membuat reservasi pada hari ' +
              reservasiDateController.text +
              '.\nKita sudah kirim email ke email Anda';
          errorMessage = '';
          isLoading = false;
        });
      } else {
        setState(() {
          successMessage = '';
          errorMessage = 'Ada Error';
          isLoading = false;
        });
      }
    } catch (Exception) {
      setState(() {
        errorMessage = Exception.toString().replaceAll('Exception: ', '');
        isLoading = false;
      });
    }
  }
}
