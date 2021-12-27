import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:barber/models/reservation.dart';
import 'package:barber/providers/AuthProvider.dart';
import 'package:barber/services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReservationProvider extends ChangeNotifier {
  List<Reservation> reservations = [];
  late ApiService apiService;
  late AuthProvider authProvider;

  ReservationProvider(AuthProvider authProvider) {
    this.authProvider = authProvider;
    this.apiService = ApiService(authProvider.token);
    init();
  }

  Future init() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('token');
    var user = json.decode(userJson!);
    int id = user['user_id'];
    reservations = await apiService.fetchReservation(id);
    notifyListeners();
  }

  Future<bool> addReservation(
      int user_id, Map<int, int> services, String reservation_time) async {
    try {
      await apiService.addReservation(user_id, services, reservation_time);
      init();
      notifyListeners();
    } catch (Exception) {
      throw Exception;
    }
    return true;
  }
}
