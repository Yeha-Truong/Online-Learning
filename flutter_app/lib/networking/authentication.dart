import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Authentication {
  static final Authentication _instance = Authentication._internal();
  factory Authentication() => _instance;
  Authentication._internal();

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
}
