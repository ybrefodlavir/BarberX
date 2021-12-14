import 'dart:convert';
import 'package:barber/models/services.dart';
import 'package:flutter/material.dart';
import 'package:barber/services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool isAuthenticated = false;
  late var token;
  late ApiService apiService;
  List<Service> services = [];
  AuthProvider() {
    init();
  }

  Future<void> init() async {
    this.token = await getToken();
    if (this.token.isNotEmpty) {
      this.isAuthenticated = true;
    }
    this.apiService = new ApiService(this.token);

    notifyListeners();
  }

  Future<void> register(String name, String email, String phone,
      String password, String passwordConfirm) async {
    this.token = await apiService.register(
        name, email, phone, password, passwordConfirm);
    setToken(this.token);
    this.isAuthenticated = true;
    notifyListeners();
  }

  Future<void> login(String login, String password) async {
    this.token = await apiService.login(login, password);
    setToken(this.token);
    this.isAuthenticated = true;
    notifyListeners();
  }

  Future<void> logOut() async {
    setToken('');
    this.isAuthenticated = false;
    notifyListeners();
  }

  Future<void> setToken(token) async {
    final prefs = await SharedPreferences.getInstance();
    if (token == '') {
      await prefs.setString('token', '');
    } else {
      var data = jsonDecode(token);
      var user = jsonEncode(data[0]);
      var services = jsonEncode(data[1]);
      await prefs.setString('token', user);
      await prefs.setString('sevices', services);
      var services_jason = prefs.getString('sevices');
      var realServices = jsonDecode(services_jason!);
      for (var i = 0; i < realServices.length; i++) {
        var firstrealServices = realServices[i];
        Service serviceObj = new Service(
            serviceId: firstrealServices['service_id'],
            categoryServiceId: firstrealServices['category_service_id'],
            name: firstrealServices['name'].toString(),
            price: firstrealServices['price'],
            image: firstrealServices['image'].toString(),
            createdAt: firstrealServices['created_at'].toString(),
            updateAt: firstrealServices['updated_at'].toString());
        this.services.add(serviceObj);
      }
    }
  }

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

  Future<void> postDataAkun(
      int id, String username, String email, String phone) async {
    this.token = await apiService.postDataAkun(id, username, email, phone);
    setToken(this.token);
    notifyListeners();
  }
}
