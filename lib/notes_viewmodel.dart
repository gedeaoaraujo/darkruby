import 'package:darkruby/model/note.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:darkruby/notes_repository.dart';

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
  final _repository = NotesRepository();
  NotesViewmodel(): super(NoteState()){ load(); }
  
  void load() {
    final result = _repository.getAllNotes();
    state = state.copyWith(notes: result);
  }

}