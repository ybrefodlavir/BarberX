import 'package:flutter/material.dart';
import 'package:barber/models/reservation.dart';
import 'package:barber/providers/AuthProvider.dart';
import 'package:barber/services/api.dart';

class ReservationProvider extends ChangeNotifier {
  List<Reservation> reservation = [];
  late ApiService apiService;
  late AuthProvider authProvider;

  ReservationProvider(AuthProvider authProvider) {
    this.authProvider = authProvider;
    this.apiService = ApiService(authProvider.token);

    init();
  }

  Future init() async {
    // reservation = await apiService.fetchReservation();
    notifyListeners();
  }

  Future<bool> addReservation(
      int user_id, Map<int, int> services, String reservation_time) async {
    try {
      await apiService.addReservation(user_id, services, reservation_time);
      // reservation.add(addedReservation);
      notifyListeners();
    } catch (Exception) {
      print(Exception.toString());

      throw Exception;
      return false;
    }
    return true;
  }
}
