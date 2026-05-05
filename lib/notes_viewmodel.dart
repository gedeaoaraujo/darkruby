import 'package:darkruby/model/note.dart';
import 'package:darkruby/note_intent.dart';
import 'package:darkruby/note_state.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:darkruby/notes_repository.dart';

class NotesViewmodel extends StateNotifier<NoteState> {
  final _repository = NotesRepository();
  
  NotesViewmodel(): super(NoteState()){
    onAction(LoadNotes());
  }

  void onAction(NoteIntent intent) {
    switch (intent) {
      case ToggleReadOnly():
        state = state.copyWith(readOnly: !state.readOnly);
      case CreateNote():
        state = state.copyWith(newNote: Note());
      case UpdateNote(:final title, :final date, :final text):
        final newNote = state.newNote?.copyWith(
          title: title, date: date, text: text
        );
        state = state.copyWith(newNote: newNote);
      case LoadNotes():
        state = state.copyWith(notes: _repository.getAllNotes());
      case SaveNote():
        _repository.createNewNote(state.newNote!);
        onAction(LoadNotes());
      case DeleteNote(:final noteId):
        _repository.deleteNoteById(noteId);
    }
  }

}