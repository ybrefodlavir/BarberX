import 'dart:convert';
import 'dart:io';
import 'package:barber/models/reservation.dart';
import 'package:barber/models/reservationDetails.dart';
import 'package:http/http.dart' as http;

class ApiService {
  late String token;

  ApiService(String token) {
    this.token = token;
  }

  final String baseUrl = 'http://192.168.2.107:80/api/';

  Future<String> register(String name, String email, String phone,
      String password, String passwordConfirm) async {
    String uri = baseUrl + 'auth/register';

    http.Response response = await http.post(Uri.parse(uri),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
          'password_confirmation': passwordConfirm,
        }));

    if (response.statusCode == 422) {
      Map<String, dynamic> body = jsonDecode(response.body);
      Map<String, dynamic> errors = body['errors'];
      String errorMessage = '';
      errors.forEach((key, value) {
        value.forEach((element) {
          errorMessage += element + '\n';
        });
      });
      throw Exception(errorMessage);
    }

    // return token
    return response.body;
  }

  Future<String> login(String login, String password) async {
    String uri = baseUrl + 'auth/login';

    http.Response response = await http.post(Uri.parse(uri),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
        },
        body: jsonEncode({'login': login, 'password': password}));

    if (response.statusCode == 422) {
      Map<String, dynamic> body = jsonDecode(response.body);
      Map<String, dynamic> errors = body['errors'];
      String errorMessage = '';
      errors.forEach((key, value) {
        value.forEach((element) {
          errorMessage += element + '\n';
        });
      });
      throw Exception(errorMessage);
    }

    // return token
    return response.body;
  }

  Future<String> postDataAkun(
      int id, String username, String email, String phone) async {
    String uri = baseUrl + 'akun/editData/' + id.toString();

    http.Response response = await http.put(Uri.parse(uri),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
        },
        body:
            jsonEncode({'username': username, 'email': email, 'phone': phone}));

    if (response.statusCode == 422) {
      Map<String, dynamic> body = jsonDecode(response.body);
      Map<String, dynamic> errors = body['errors'];
      String errorMessage = '';
      errors.forEach((key, value) {
        value.forEach((element) {
          errorMessage += element + '\n';
        });
      });
      throw Exception(errorMessage);
    }

    // return token
    return response.body;
  }

  Future<String> postPassword(int id, String oldPassword, String password,
      String passwordConfirm) async {
    String uri = baseUrl + 'akun/change/password/' + id.toString();
    http.Response response = await http.put(Uri.parse(uri),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
        },
        body: jsonEncode({
          'oldPassowed': oldPassword,
          'password': password,
          'password_confirmation': passwordConfirm
        }));

    if (response.statusCode == 422) {
      Map<String, dynamic> body = jsonDecode(response.body);
      Map<String, dynamic> errors = body['errors'];
      String errorMessage = '';
      errors.forEach((key, value) {
        value.forEach((element) {
          errorMessage += element + '\n';
        });
      });
      throw Exception(errorMessage);
    }

    // return token
    return response.body;
  }

  Future<List<Reservation>> fetchReservation(int id) async {
    http.Response response = await http.get(
      Uri.parse(baseUrl + 'reservations/' + id.toString()),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
    );
    List reservations = jsonDecode(response.body);
    return reservations
        .map((reservation) => Reservation.fromJson(reservation))
        .toList();
  }

  Future<List<ReservationDetails>> fetchReservationDetails(String id) async {
    http.Response response = await http.get(
      Uri.parse(baseUrl + 'reservations/details/' + id.toString()),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
    );
    List reservationDetails = jsonDecode(response.body);
    return reservationDetails
        .map((reservationDetail) =>
            ReservationDetails.fromJson(reservationDetail))
        .toList();
  }

  Future<String> addReservation(
      int user_id, Map<int, int> services, String reservation_time) async {
    String uri = baseUrl + 'reservasi/add/reservations';
    var data = [];
    services.forEach((k, v) => data.add((k)));
    http.Response response = await http.post(Uri.parse(uri),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
        },
        body: jsonEncode({
          'user_id': user_id,
          'services': data,
          'reservation_time': reservation_time,
        }));
    if (response.statusCode == 422) {
      throw Exception('Error happened on create');
    }
    return response.body;
  }

  Future<bool> deleteReservationApi(String code) async {
    String uri = baseUrl + 'reservasi/delete/reservation/' + code;
    http.Response response = await http.delete(Uri.parse(uri),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
        },
        body: jsonEncode({
          'reservation_code': code,
        }));
    if (response.statusCode == 422 || response.statusCode == 500) {
      return false;
    }
    if (response.body == 'true') {
      return true;
    } else {
      return false;
    }
  }
}
