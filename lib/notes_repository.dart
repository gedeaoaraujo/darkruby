import 'package:darkruby/memory_database.dart';
import 'package:darkruby/model/note.dart';

class NotesRepository {
  final _database = InMemoryDataBase();
  NotesRepository();

  List<Note> getAllNotes() {
    return _database.getAllNotes();
  }

  void createNewNote(Note note){
    _database.createNewNote(note);
  }
}
