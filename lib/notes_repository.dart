import 'package:darkruby/model/note.dart';
import 'package:darkruby/note_dao.dart';

class NotesRepository {
  final NoteDao _noteDao;
  NotesRepository(this._noteDao);

  Future<List<Note>> getAllNotes() {
    return _noteDao.getAllNotes();
  }

  Future<Note?> getNoteById(int id) {
    return _noteDao.getNoteById(id);
  }

  Future<void> upsertNote(Note note) async {
    await _noteDao.upsert(note.toMap());
  }

  Future<void> deleteNoteById(int id) async {
    await _noteDao.deleteById(id);
  }

  bool checkPassword(String password) {
    return password == '';
  }
}
