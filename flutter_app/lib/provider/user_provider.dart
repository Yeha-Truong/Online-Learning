import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/sqlite/database.dart';

class UserProvider extends ChangeNotifier {
  User? _user;
  final OLDatabase _database = OLDatabase();

  User? get user => _user;
  set user(value) => _user = value;

  Future<void> saveUser(User data) async {
    user = data;
    var formatted = data.toJson();
    formatted['active'] = true;
    await _database.insert('user', formatted);
    notifyListeners();
  }

  Future<void> loadUser() async {
    var users = await _database.query('user', 'active==true');
    if (users.isNotEmpty) {
      var data = Map<String, dynamic>.from(users.first);
      data['phoneNumberConfirmed'] =
          data['phoneNumberConfirmed'] == 1 ? true : false;
      data['lockoutEnabled'] = data['lockoutEnabled'] == 1 ? true : false;
      data['active'] = data['active'] == 1 ? true : false;

      user = User.fromJson(data);
    } else
      user = null;
    notifyListeners();
  }

  Future<void> deactiveUser() async {
    await _database.update('user', {'active': false}, 'active==true');
    notifyListeners();
  }
}
