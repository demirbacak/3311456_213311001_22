import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/inspirations_model.dart';

class LocalDbUtils {

  static final LocalDbUtils _dbUtils = LocalDbUtils._internal();

  LocalDbUtils._internal();

  factory LocalDbUtils() {
    return _dbUtils;
  }

  static Database? _db;

  Future<Database?> get db async {
    _db ??= await initializeDb();
    return _db;
  }

  Future<Database> initializeDb() async {
    String path = join(await getDatabasesPath(), 'ispirations_database.db');
    var dbIspirations = await openDatabase(path, version: 1, onCreate: _createDb);
    return dbIspirations;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE inspirations(id INTEGER PRIMARY KEY, title TEXT, content TEXT)");
  }

  Future<void> deleteTable() async {
    final Database? db = await this.db;
    db?.delete('inspirations');
  }

  Future<void> insertInspiration(Inspiration inspiration) async {
    final Database? db = await this.db;
    await db?.insert(
      'inspirations',
      inspiration.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the dogs from the dogs table.
  Future<List<Inspiration>> inspirations() async {
    // Get a reference to the database.
    final Database? db = await this.db;
    // Query the table for all inspirations.
    final List<Map<String, Object?>>? maps = await db?.query('inspirations');

    // Convert the List<Map<String, dynamic> into a List<Inspiration>.
    return List.generate(maps!.length, (i) {
      return Inspiration(
        //id: int.parse(maps[i]['id'].toString()),
        title: maps[i]['title'].toString(),
        content: maps[i]['content'].toString(),
      );
    });
  }

  Future<void> updateInspiration(Inspiration inspiration) async {
    final db = await this.db;
    await db?.update(
      'inspirations',
      inspiration.toMap(),
      where: "title = ?",
      whereArgs: [inspiration.title],
    );
  }

  Future<void> deleteInspiration(String title) async {
    final db = await this.db;
    await db?.delete(
      'inspirations',
      where: "title = ?",
      whereArgs: [title],
    );
  }
}