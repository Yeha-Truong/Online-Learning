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
          response = await http.post(
            Uri.https(_url, url),
            body: jsonEncode(body),
            headers: {
              "Accept": "application/json",
              "content-type": "application/json",
              "Authorization": "Bearer $token",
            },
          );
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

  Future<dynamic> put(String url, dynamic body,
      {required bool authorization}) async {
    var responseJson;
    if (authorization)
      try {
        String token = await _authentication.token;
        var response = await http.put(
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
          response = await http.put(
            Uri.https(_url, url),
            body: jsonEncode(body),
            headers: {
              "Accept": "application/json",
              "content-type": "application/json",
              "Authorization": "Bearer $token",
            },
          );
          responseJson = await _returnResponse(response);
        }
      } on SocketException {
        throw NetworkException('No Internet connection');
      }
    else
      try {
        final response = await http.put(
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

  Future<dynamic> multipart(String url, String method, String field, File file,
      {required bool authorization}) async {
    var responseJson;
    if (authorization)
      try {
        String token = await _authentication.token;
        var request = await http.MultipartRequest(
          method,
          Uri.https(_url, url),
        );
        request.headers.addAll({
          "Accept": "application/json",
          "content-type": "application/json",
          "Authorization": "Bearer $token",
        });
        request.files
            .add(await await http.MultipartFile.fromPath(field, file.path));
        var res = await request.send();

        var body = jsonDecode(await res.stream.bytesToString());
        var status = res.statusCode;

        responseJson = await _convertResponse(body, status);

        if (responseJson == null) {
          request = await http.MultipartRequest(
            method,
            Uri.https(_url, url),
          );
          request.headers.addAll({
            "Accept": "application/json",
            "content-type": "application/json",
            "Authorization": "Bearer $token",
          });
          request.files.add(
              await await http.MultipartFile.fromPath('picture', file.path));
          var res = await request.send();

          var body = jsonDecode(await res.stream.bytesToString());
          var status = res.statusCode;

          responseJson = await _convertResponse(body, status);
        }
      } on SocketException {
        throw NetworkException('No Internet connection');
      }
    else
      try {
        var request = await http.MultipartRequest(
          method,
          Uri.https(_url, url),
        );
        request.headers.addAll({
          "Accept": "application/json",
          "content-type": "application/json",
        });
        request.files
            .add(await await http.MultipartFile.fromPath(field, file.path));
        var res = await request.send();

        var body = jsonDecode(await res.stream.bytesToString());
        var status = res.statusCode;

        responseJson = await _convertResponse(body, status);
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

  dynamic _convertResponse(Map<String, dynamic> body, int status) async {
    switch (status) {
      case 200:
        return body;
      case 400:
        throw BadRequestException(body['message']);
      case 401:
        throw TokenExpiredException(body['message']);
      case 500:
      default:
        if (body['message'] != null)
          throw BadRequestException(body['message']);
        else
          BadRequestException(
              'Error occured while Communication with Server with StatusCode : ${status}');
    }
  }
}
