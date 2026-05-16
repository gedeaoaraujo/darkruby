import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDatabase {
  
  static late final Database database;

  static FutureOr<void> init() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'darkruby.db');
    database = await openDatabase(
      path, version: 1,
      onCreate: (Database db, int version) async {
        String query = 'create table if not exists Notes(';
        query += 'id integer primary key autoincrement,';
        query += 'title text not null,';
        query += 'date text not null,';
        query += 'text text not null)';
        await db.execute(query);
      }
    );
  }

  static Future<void> delete() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'darkruby.db');
    deleteDatabase(path);
  }

  static Future<void> close() async => database.close();
}
