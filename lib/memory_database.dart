import 'package:darkruby/model/note.dart';

class InMemoryDataBase {
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

  void createNewNote(Note note) {
    final newId = _notes.length + 1;
    final newNote = Note(
      id: newId, title: note.title, 
      date: note.date, text: note.text
    );
    _notes.add(newNote);
  }
}
