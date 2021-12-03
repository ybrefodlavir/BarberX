import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:barber/services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool isAuthenticated = false;
  late var token;
  late ApiService apiService;

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
    }
  }

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }
}
