import 'package:darkruby/model/note.dart';
import 'package:darkruby/note_dao.dart';

class NotesRepository {
  final NoteDao noteDao;
  NotesRepository(this.noteDao);

  Future<List<Note>> getAllNotes() {
    return noteDao.getAllNotes();
  }

  Future<void> upsertNote(Note note) async {
    await noteDao.upsert(note);
  }

  Future<void> deleteNoteById(int noteId) async {
    await noteDao.deleteById(noteId);
  }

  bool checkPassword(String password) {
    return password == '';
  }
}
