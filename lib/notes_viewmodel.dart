import 'package:darkruby/note_state.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:darkruby/notes_repository.dart';

class NotesViewmodel extends StateNotifier<NoteState> {
  final _repository = NotesRepository();
  
  NotesViewmodel(): super(NoteState()){
    onAction(LoadNotes());
  }

  void onAction(NoteIntent intent) {
    state = switch (intent) {
      ToggleReadOnly() => state.copyWith(
        readOnly: !state.readOnly
      ),
      LoadNotes() => state.copyWith(
        notes: _repository.getAllNotes()
      )
    };
  }

}