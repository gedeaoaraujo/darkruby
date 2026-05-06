import 'package:darkruby/memory_database.dart';
import 'package:darkruby/model/note.dart';

class NotesRepository {
  final _database = InMemoryDataBase();
  NotesRepository();

  List<Note> getAllNotes() {
    return _database.getAllNotes();
  }

  void upsertNote(Note note){
    _database.upsertNote(note);
  }

  void deleteNoteById(int noteId) {
    _database.deleteNoteById(noteId);
  }
}
