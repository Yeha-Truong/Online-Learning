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
}
