import 'dart:io';

import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/networking/authentication.dart';
import '../client.dart';

class UserRepository {
  APIClient _client = APIClient();

  Future<void> login(String email, String password) async {
    //await _authentication.login(email, password);
    return;
  }

  Future<void> register(
      String email, String name, String phone, String password) async {
    await _client.post(
        '/user/register',
        {
          'email': email,
          'name': name,
          'phone': phone,
          'password': password,
        },
        authorization: false);
    return;
  }

  Future<User> signin(String email, String password) async {
    var response = await _client.post(
        '/user/login',
        {
          'email': email,
          'password': password,
        },
        authorization: false);
    Authentication authentication = Authentication();
    authentication.token = response['token'];
    User user = User.fromJson(response['userInfo']);
    return user;
  }

  Future<User> google(String email, String id) async {
    var response = await _client.post(
        '/user/login-google-mobile',
        {
          'user': {
            'email': email,
            'id': id,
          }
        },
        authorization: false);
    Authentication authentication = Authentication();
    authentication.token = response['token'];
    User user = User.fromJson(response['userInfo']);
    return user;
  }

  Future<void> changePassword(
      String id, String deprecated, String password) async {
    await _client.post(
        '/user/change-password',
        {
          'id': id,
          'oldPass': deprecated,
          'newPass': password,
        },
        authorization: true);
    return;
  }

  Future<void> forgotPassword(String email) async {
    await _client.post(
        '/user/forget-pass/send-email',
        {
          'email': email,
        },
        authorization: false);
    return;
  }

  Future<void> uploadAvatar(File file) async {
    // ignore: unused_local_variable
    var response = await _client.multipart(
        '/user/upload-avatar', 'POST', 'avatar', file,
        authorization: true);
    return;
  }

  Future<User> update(String name, String phone, String avatar) async {
    var response = await _client.put('/user/update-profile',
        {'name': name, 'phone': phone, 'avatar': avatar},
        authorization: true);
    User user = User.fromJson(response['payload']);
    return user;
  }
}
