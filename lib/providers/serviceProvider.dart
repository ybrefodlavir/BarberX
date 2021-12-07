import 'package:flutter/material.dart';
import 'package:barber/models/services.dart';
import 'package:barber/providers/AuthProvider.dart';
import 'package:barber/services/api.dart';

class ServiceProvider extends ChangeNotifier {
  List<Service> services = [];
  late ApiService apiService;
  late AuthProvider authProvider;

  ServiceProvider(AuthProvider authProvider) {
    this.authProvider = authProvider;
    this.apiService = ApiService(authProvider.token);
    init();
  }

  Future init() async {
    // services = await authProvider.init();
    notifyListeners();
  }
}
