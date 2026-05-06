import 'package:darkruby/model/note.dart';
import 'package:darkruby/note_intent.dart';
import 'package:darkruby/note_state.dart';
import 'package:flutter/widgets.dart';
import 'package:darkruby/notes_repository.dart';

class NotesViewmodel extends ChangeNotifier {
  final _repository = NotesRepository();
  
  NoteState _state = .new();
  NoteState get state => _state;
  
  NotesViewmodel() {
    onAction(LoadNotes());
  }

  void onAction(NoteIntent intent) {
    switch (intent) {
      case ToggleReadOnly():
        _state = state.copyWith(readOnly: !state.readOnly);
      case CreateNote():
        _state = state.copyWith(newNote: Note());
      case UpdateNote(:final title, :final date, :final text):
        final newNote = state.newNote?.copyWith(
          title: title, date: date, text: text
        );
        _state = state.copyWith(newNote: newNote);
      case LoadNotes():
        _state = state.copyWith(notes: _repository.getAllNotes());
      case SaveNote():
        _repository.createNewNote(state.newNote!);
      case DeleteNote(:final noteId):
        _repository.deleteNoteById(noteId);
      case SelectNote(:final noteId):
        final note = state.notes.firstWhere((e) => e.id == noteId);
        _state = state.copyWith(newNote: note);
    }
    notifyListeners();
  }

}