import 'dart:async';

import 'package:education/models/data/data_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  Database? _database;

  final String tableName = 'tableData';
  final String columnId = 'id';
  final String columnName = 'name';
  final String columnNumber = 'number';
  final String columnAge = 'age';
  final String columnAddress = 'address';
  final String columnCreatedAt = 'createdAt';

  DbHelper._internal();
  factory DbHelper() => _instance;

  Future<Database?> get _db async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDb();
    return _database;
  }

  Future<Database?> _initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'data.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    try {
      final sql =
          'CREATE TABLE $tableName ($columnId INTEGER PRIMARY KEY, $columnName VARCHAR, $columnNumber VARCHAR, $columnAge VARCHAR, $columnAddress VARCHAR)';
      await db.execute(sql);
    } catch (e) {
      rethrow;
    }
  }

  Future<int> saveData(DataModel data) async {
    try {
      final dbClient = await _db;
      return await dbClient!.insert(tableName, data.toMap());
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<DataModel>> getAllData() async {
    try {
      final dbClient = await _db;
      final result = await dbClient!.query(tableName, columns: [
        columnId,
        columnName,
        columnNumber,
        columnAge,
        columnAddress,
        columnCreatedAt
      ]);
      List<DataModel> data = result.map((e) => DataModel.fromMap(e)).toList();
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<int?> updateData(DataModel data, int id) async {
    try {
      final dbClient = await _db;
      return await dbClient!.update(tableName, data.toMap(),
          where: '$columnId = ?', whereArgs: [id]);
    } catch (e) {
      rethrow;
    }
  }

  Future<int?> deleteData(int id) async {
    try {
      final dbClient = await _db;
      return await dbClient!
          .delete(tableName, where: '$columnId = ?', whereArgs: [id]);
    } catch (e) {
      rethrow;
    }
  }
}
