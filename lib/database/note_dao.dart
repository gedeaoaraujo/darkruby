import 'package:darkruby/csv_utils.dart';
import 'package:darkruby/database/dao.dart';
import 'package:darkruby/mappers.dart';
import 'package:darkruby/model/note.dart';

class NoteDao extends Dao {

  @override
  String get tableName => 'Notes';

  Future<List<Note>> getAllNotes() async {
    final notes = await super.getAll();
    return notes.map((e) => e.toNote()).toList();
  }

  Future<Note?> getNoteById(int id) async {
    final note = Note(id: id).toMap();
    final result = await super.getById(note);
    return result?.toNote();
  }

  Future<void> exportNotes() async {
    final notes = await super.getAll();
    await exportNotesCsvZip(notes);
  }

  Future<void> importNotes(String path) async {
    await importNoteCsvZip(path);
  }

}