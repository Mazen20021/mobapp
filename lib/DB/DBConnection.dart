import 'dart:async';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._getInstance();
  static Database? _database;
  DatabaseHelper();
  DatabaseHelper._getInstance();

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final appDocumentsDirectory = await getApplicationDocumentsDirectory();
    final dbDirectory =
        await Directory(path.join(appDocumentsDirectory.path, 'mobappdb'))
            .create(recursive: true);
    final dbPath = path.join(dbDirectory.path, 'SVIG.db');
    print("Database path: $dbPath");

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        _createUsers(db, version);
        _createHolders(db, version);
        print("Creating Users and Holders tables...");
      },
    );
  }

  void _createUsers(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS Users (
        Name TEXT,
        Email TEXT PRIMARY KEY ,
        Password TEXT
      )
    ''');
    print("Users Created !");
  }

  void _createHolders(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS Holders (
        ID TEXT PRIMARY KEY,
        Name TEXT,
        Email TEXT
      )
    ''');
    print("Holders Created !");
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    Database db = await instance.database;
    return await db.insert('Users', user);
  }

  Future<int> addholder(Map<String, dynamic> user) async {
    Database db = await instance.database;
    String query = "INSERT INTO Holders (ID, Name , Email) VALUES (?, ? , ?)";
    return await db.rawInsert(query, [user['ID'], user['Name'], user['Email']]);
  }
  // Add more methods for CRUD operations (e.g., insert, update, delete, etc.)
}
