import 'package:darkruby/csv_utils.dart';
import 'package:darkruby/database/dao.dart';
import 'package:darkruby/database/sql_database.dart';
import 'package:darkruby/mappers.dart';
import 'package:darkruby/model/note.dart';

class NoteDao extends Dao {

  @override
  String get tableName => 'Notes';

  Future<List<Note>> getAllNotes() async {
    final notes = await SqlDatabase.database.rawQuery(
      'SELECT * FROM $tableName ORDER BY date DESC'
    );
    return notes.map((note) => note.toNote()).toList();
  }

  Future<Note?> getNoteById(int id) async {
    final note = Note(id: id).toMap();
    final result = await super.getById(note);
    return result?.toNote();
  }

  Future<String> exportNotes() async {
    final notes = await getAllNotes();
    final mapped = notes.map((e) => e.toMap());
    return await exportNotesCsvZip(mapped.toList());
  }

  Future<void> importNotes(String path) async {
    final notes = await importNoteCsvZip(path);
    final list = notes.map((e) => e.toMap()).toList();
    await upsertList(list);
  }

  Future<void> deleteNotes() async {
    await super.deleteAll();
  }

}