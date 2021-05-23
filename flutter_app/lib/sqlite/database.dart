import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class OLDatabase {
  static final OLDatabase _instance = OLDatabase._();
  Database? _database;

  OLDatabase._();

  factory OLDatabase() {
    return _instance;
  }

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await init();

    return _database;
  }

  Future<Database> init() async {
    var database = openDatabase(join(await getDatabasesPath(), 'database.db'),
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);

    return database;
  }

  void _onCreate(Database db, int version) {
    db.execute(
      "CREATE TABLE user(id TEXT PRIMARY KEY, email TEXT, avatar TEXT, name TEXT, favoriteCategories TEXT, point INTEGER, phone TEXT, type TEXT, isDeleted BOOLEAN, isActivated BOOLEAN,createdAt TEXT, updatedAt TEXT, active BOOLEAN, userType INTEGER)",
    );
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    // Run migration according database versions
  }

  Future<int> insert(String table, Map<String, dynamic> data) async {
    var client = await database;
    return await client!
        .insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> query(String table, String where) async {
    var client = await database;

    var users = await client!.query(table, where: where);

    return users;
  }

  Future<int> update(
    String table,
    Map<String, dynamic> data,
    String where,
  ) async {
    var client = await database;
    return client!.update(
      table,
      data,
      where: where,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> remove(String table, String where) async {
    var client = await database;
    return client!.delete(table, where: where);
  }

  Future closeDb() async {
    var client = await database;
    client!.close();
  }
}
