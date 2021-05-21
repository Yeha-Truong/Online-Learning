import 'package:flutter_app/models/user.dart';

import '../authentication.dart';
import '../client.dart';

class UserRepository {
  APIClient _client = APIClient();
  Authentication _authentication = Authentication();

  Future<void> login(String email, String password) async {
    await _authentication.login(email, password);
    return;
  }

  Future<User> getDetail() async {
    User user = User.fromJson(
        (await _client.get('/api/user/details', authorization: true))['data']);
    return user;
  }
}
