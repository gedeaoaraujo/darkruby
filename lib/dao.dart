import 'package:darkruby/sql_database.dart';
import 'package:darkruby/types.dart';

abstract class Dao {

  abstract final String tableName;

  Future<void> upsert(dynamic entity) async {
    final db = SqlDatabase.database;
    await db.insert(
      tableName,
      entity.toMap(),
      conflictAlgorithm: .replace
    );
  }

  Future<AnyMap?> getById(dynamic entity) async {
    final db = SqlDatabase.database;
    final obj = entity.toMap();
    final maps = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [obj.id], 
      columns: entity.keys.toList(),
    );
    return maps.firstOrNull;
  }

  Future<List<AnyMap>> getAll() async {
    final db = SqlDatabase.database;
    final result = await db.query(tableName);
    return result;
  }

  Future<void> deleteById(int id) async {
    final db = SqlDatabase.database;
    await db.delete(
      tableName, 
      where: 'id = ?',
      whereArgs: [id]
    );
  }

  Future<void> update(dynamic entity) async {
    final db = SqlDatabase.database;
    await db.update(
      tableName,
      entity.toMap(),
      where: 'id = ?',
      whereArgs: [entity.id]
    );
  }

}
