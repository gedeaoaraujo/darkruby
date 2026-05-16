import 'package:darkruby/dao.dart';
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
    final result = await super.getById(id);
    return result?.toNote();
  }

}