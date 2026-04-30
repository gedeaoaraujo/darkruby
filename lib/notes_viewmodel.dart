import 'package:flutter_riverpod/legacy.dart';

class Note {
  final String title;
  final String date;
  final String text;

  Note({
    required this.title, 
    required this.date, 
    required this.text
  });
}

class NoteState {
  final List<Note> notes;
  NoteState({this.notes = const []});

  NoteState copyWith({
    List<Note>? notes
  }) => NoteState(
    notes: notes ?? const []
  );
}

class NotesViewmodel extends StateNotifier<NoteState> {
  NotesViewmodel(): super(NoteState()){
    load();
  }

  List<Note> genItems() => List.generate(100, (i){
    return Note(
      date: '22/05/1998',
      title: 'New title ${++i}',
      text: List.generate(255, (_) => 'x').join());
  });
  
  Future<void> load() async {
    state = state.copyWith(notes: genItems());
  }

}