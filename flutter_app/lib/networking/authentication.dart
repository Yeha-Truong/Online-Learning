import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'client.dart';
import 'exception.dart';

class Authentication {
  static final Authentication _instance = Authentication._internal();
  factory Authentication() => _instance;
  Authentication._internal();

  static final APIClient _client = APIClient();

  get token => FlutterSecureStorage().read(key: 'token');
  get refreshToken => FlutterSecureStorage().read(key: 'refreshToken');
  set token(value) => FlutterSecureStorage().write(
        key: 'token',
        value: value,
      );
  set refreshToken(value) => FlutterSecureStorage().write(
        key: 'refreshToken',
        value: value,
      );

  Future<void> login(String email, String password) async {
    final response = await _client.post(
      "/api/user/login",
      {'email': email, 'password': password},
      authorization: false,
    );
    token = response['data']['token'];
    refreshToken = response['data']['refreshToken'];
    return;
  }

  Future<dynamic> refresh() async {
    final String refresh = await refreshToken;
    final response = await _client.post(
      '/api/user/refreshToken',
      {'refreshToken': refresh},
      authorization: false,
    );

    return _returnResponseCode(response);
  }

  int _returnResponseCode(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body.toString());
        token = responseJson['data']['token'];
        refreshToken = responseJson['data']['refreshToken'];
        return 200;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw TokenExpiredException(response.body.toString());
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw NetworkException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
