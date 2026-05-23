import 'package:darkruby/database/sql_database.dart';
import 'package:darkruby/types.dart';

abstract class Dao {

  abstract final String tableName;

  Future<void> upsert(AnyMap entity) async {
    await SqlDatabase.database.insert(
      tableName, entity,
      conflictAlgorithm: .replace
    );
  }
  
  Future<void> upsertList(List<AnyMap> entities) async {
    final batch = SqlDatabase.database.batch();
    for (var entity in entities) {
      batch.insert(
        tableName, entity,
        conflictAlgorithm: .replace
      );
    }
    batch.commit(noResult: true);
  }

  Future<AnyMap?> getById(AnyMap entity) async {
    final maps = await SqlDatabase.database.query(
      tableName, where: 'id = ?',
      whereArgs: [entity['id']],
      columns: entity.keys.toList(),
    );
    return maps.firstOrNull;
  }

  Future<List<AnyMap>> getAll() async =>
    await SqlDatabase.database.query(tableName);

  Future<void> deleteById(int id) async {
    await SqlDatabase.database.delete(
      tableName, where: 'id = ?', whereArgs: [id]
    );
  }

  Future<void> deleteAll() async {
    await SqlDatabase.database.delete(tableName);
  }

}
