import 'package:darkruby/model/note.dart';

class InMemoryDataBase {
  final String _password = '888';
  final List<Note> _notes = .empty(growable: true);
  
  InMemoryDataBase() {
    _notes.addAll(genItems());
  }

  List<Note> genItems() => List.generate(3, (i){
    return Note(
      id: ++i,
      date: '22/05/1998',
      title: 'New title $i',
      text: List.generate(999, (_) => 'xxxxxx').join());
  });

  List<Note> getAllNotes() {
    return _notes;
  }

  void upsertNote(Note note) {
    if (note.isInserted){
      final index = _notes.indexWhere(
        (e) => e.id == note.id
      );
      _notes[index] = note;
      return;
    }

    final newId = _notes.length + 1;
    final newNote = Note(
      id: newId, title: note.title, 
      date: note.date, text: note.text
    );
    _notes.add(newNote);
  }

  void deleteNoteById(int noteId) {
    _notes.removeWhere((e) => e.id == noteId);
  }

  bool checkPassword(String password){
    return password == _password;
  }
}
