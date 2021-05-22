import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/sqlite/database.dart';

class UserProvider extends ChangeNotifier {
  User _user = User();
  final OLDatabase _database = OLDatabase();

  User get user => _user;
  set user(value) => _user = value;

  Future<void> saveUser(User? data) async {
    if (data != null) {
      user = data;
      var formatted = data.toJson();
      formatted['active'] = true;
      await _database.insert('user', formatted);
      notifyListeners();
    }
  }

  Future<bool> loadUser() async {
    var users = await _database.query('user', 'active==true');
    if (users.isNotEmpty) {
      var data = Map<String, dynamic>.from(users.first);
      data['isDeleted'] = data['isDeleted'] == 1 ? true : false;
      data['isActivated'] = data['isActivated'] == 1 ? true : false;
      data['active'] = data['active'] == 1 ? true : false;

      user = User.fromJson(data);
      notifyListeners();
      return true;
    }

    return false;
  }

  Future<void> deactiveUser() async {
    await _database.update('user', {'active': false}, 'active==true');
    notifyListeners();
  }
}
