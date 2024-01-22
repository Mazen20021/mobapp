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
    // Get the application documents directory
    final appDocumentsDirectory = await getApplicationDocumentsDirectory();

    // Create the custom directory if it doesn't exist
    final dbDirectory =
        await Directory(path.join(appDocumentsDirectory.path, 'mobappdb'))
            .create(recursive: true);

    // Get the path for the database file
    final dbPath = path.join(dbDirectory.path, 'SVIG.db');

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: _createDB,
    );
  }

  void _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS Users (
        Name TEXT,
        Email TEXT PRIMARY KEY ,
        Password TEXT
      )
    ''');
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    Database db = await instance.database;
    return await db.insert('Users', user);
  }

  // Add more methods for CRUD operations (e.g., insert, update, delete, etc.)
}
