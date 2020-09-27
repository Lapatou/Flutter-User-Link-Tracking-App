import 'dart:async';
import 'dart:io';
import 'package:memoamcav2/dataModel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHandler {
  static final _dbName = "hesapDef.db";
  static final _dbVersion = 1;
  static final _tableName = "datas";

  //singleton yapmak
  DBHandler._privateConstructor();
  static final DBHandler instance = DBHandler._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDB();

    return _database;
  }

  _initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) {
    return db.execute(
        "CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, name TEXT, link TEXT, firstdate NUMERIC,lastdate NUMERIC, borc REAL, visible INTEGER)");
  }

  Future<int> insert(DataModel data) async {
    Database db = await instance.database;
    return await db.insert(_tableName, data.toMap());
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.database;
    return db.query(_tableName, orderBy: "lastdate ASC");
  }

  Future<List<Map<String, dynamic>>> queryForName(String name) async {
    Database db = await instance.database;
    return db.query(
      _tableName,
      where: "name = ?",
      whereArgs: [name],
    );
  }

  Future<int> update(DataModel data) async {
    Database db = await instance.database;
    return await db.update(_tableName, data.toMap(),
        where: "id = ?", whereArgs: [data.id]);
  }
}

//"CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, link TEXT, date NUMERIC, borc REAL, visible INTEGER)"
