import 'package:darkruby/data_base.dart';
import 'package:darkruby/model/note.dart';

class NotesRepository {
  final _database = InMemoryDataBase();
  NotesRepository();

  List<Note> getAllNotes() {
    return _database.getAllNotes();
  }
}
