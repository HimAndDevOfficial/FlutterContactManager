
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databaseName = "myDatabase.db";
  static final _databaseVersion = 1;

  static final table = "Contacts";

  static final columnId = "id";
  static final columnName = "name";
  static final columnEmail = "email";
  static final colmunPhone = "phone";

  //make this a singleton class
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  //only have single instance of database
  static Database? _database;
  Future<Database> get database async {
    if(_database!=null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

//open the database
  _initDatabase() async {
    Directory documentDirectory = await getApplicationSupportDirectory();
    String path = join(documentDirectory.path, _databaseName);

    return await openDatabase(path,
        version: _databaseVersion, onCreate:_onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
       $columnId INTEGER PRIMARY KEY, 
       $columnName TEXT NOT NULL,
       $columnEmail TEXT NOT NULL,
       $colmunPhone TEXT NOT NULL
    )
    ''');
  }

  Future<int> insert(Map<String,dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String,dynamic>>> queryAll() async {
    Database db = await instance.database;
    return await db.query(table);
  }
}