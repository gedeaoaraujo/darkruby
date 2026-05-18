import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class SqlDatabase {
  
  static late final Database database;

  static FutureOr<void> init() async {
    sqfliteFfiInit();
    final io.Directory dir = await getApplicationDocumentsDirectory();
    final path = join(dir.path, 'databases', 'darkruby.db');

    final dbFactory = databaseFactoryFfi;
    database = await dbFactory.openDatabase(
      path, options: .new(version: 1, onCreate:
      (Database db, int version) async {
        String query = 'create table if not exists Notes(';
        query += 'id integer primary key autoincrement,';
        query += ' title text not null,';
        query += ' date text not null,';
        query += ' text text not null)';
        await db.execute(query);

        query = 'create table if not exists Password(';
        query += 'id integer primary key autoincrement,';
        query += ' password text not null)';
        await db.execute(query);

        query = "insert into Password values (null, '000');";
        await db.execute(query);
      }
    ));
  }

  static Future<void> delete() async {
    final io.Directory dir = await getApplicationDocumentsDirectory();
    final path = join(dir.path, 'databases', 'darkruby.db');
    deleteDatabase(path);
  }

  static Future<void> close() async => database.close();
}
