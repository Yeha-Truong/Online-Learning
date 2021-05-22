import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'authentication.dart';
import 'exception.dart';

class APIClient {
  static final APIClient _instance = APIClient._internal();
  factory APIClient() => _instance;
  APIClient._internal();

  final String _url = "api.letstudy.org";
  static final Authentication _authentication = Authentication();

  Future<dynamic> get(String url, {required bool authorization}) async {
    var responseJson;
    if (authorization)
      try {
        String token = await _authentication.token;
        var response = await http.get(Uri.https(_url, url), headers: {
          "Authorization": "Bearer $token",
        });

        responseJson = await _returnResponse(response);

        if (responseJson == null) {
          response = await http.get(Uri.https(_url, url), headers: {
            "Authorization": "Bearer $token",
          });
          responseJson = await _returnResponse(response);
        }
      } on SocketException {
        throw NetworkException('No Internet connection');
      }
    else
      try {
        final response = await http.get(Uri.https(_url, url));
        responseJson = await _returnResponse(response);
      } on SocketException {
        throw NetworkException('No Internet connection');
      }

    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body,
      {required bool authorization}) async {
    var responseJson;
    if (authorization)
      try {
        String token = await _authentication.token;
        var response = await http.post(
          Uri.https(_url, url),
          body: jsonEncode(body),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
            "Authorization": "Bearer $token",
          },
        );
        responseJson = await _returnResponse(response);
        if (responseJson == null) {
          response = await http.get(Uri.https(_url, url), headers: {
            "Authorization": "Bearer $token",
          });
          responseJson = await _returnResponse(response);
        }
      } on SocketException {
        throw NetworkException('No Internet connection');
      }
    else
      try {
        final response = await http.post(
          Uri.https(_url, url),
          body: jsonEncode(body),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          },
        );
        responseJson = await _returnResponse(response);
      } on SocketException {
        throw NetworkException('No Internet connection');
      }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) async {
    var responseJson = jsonDecode(response.body.toString());
    switch (response.statusCode) {
      case 200:
        return responseJson;
      case 400:
        throw BadRequestException(responseJson['message']);
      case 401:
        throw TokenExpiredException(responseJson['message']);
      case 500:
      default:
        if (responseJson['message'] != null)
          throw BadRequestException(responseJson['message']);
        else
          BadRequestException(
              'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
