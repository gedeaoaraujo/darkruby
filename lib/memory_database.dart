import 'package:darkruby/model/note.dart';

class InMemoryDataBase {
  final List<Note> _notes = .empty(growable: true);
  
  InMemoryDataBase() {
    _notes.addAll(genItems());
  }

  List<Note> genItems() => List.generate(100, (i){
    return Note(
      date: '22/05/1998',
      title: 'New title ${++i}',
      text: List.generate(255, (_) => 'x').join());
  });

  List<Note> getAllNotes() {
    return _notes;
  }
}
