import 'package:darkruby/model/note.dart';
import 'package:darkruby/note_dao.dart';
import 'package:darkruby/note_intent.dart';
import 'package:darkruby/note_state.dart';
import 'package:flutter/material.dart';
import 'package:darkruby/notes_repository.dart';

class NotesViewmodel extends ChangeNotifier {
  final _repository = NotesRepository(NoteDao());
  
  NoteState _state = .new();
  NoteState get state => _state;
  
  NotesViewmodel() {
    onAction(LoadNotes());
  }

  Future<void> onAction(NoteIntent intent) async {
    switch (intent) {
      case ToggleReadOnly(:final readOnly):
        _state = state.copyWith(readOnly: readOnly ?? !state.readOnly);
      case CreateNote():
        _state = state.copyWith(newNote: Note());
      case UpdateNote(:final title, :final date, :final text):
        final newNote = state.newNote?.copyWith(
          title: title, date: date, text: text
        );
        _state = state.copyWith(newNote: newNote);
      case LoadNotes():
        final notes = await _repository.getAllNotes();
        _state = state.copyWith(notes: notes);
      case SaveNote():
        _repository.upsertNote(state.newNote!);
        await onAction(LoadNotes());
      case DeleteNote(:final noteId):
        if (noteId == null) return;
        await _repository.deleteNoteById(noteId);
        await onAction(LoadNotes());
      case SelectNote(:final noteId):
        if (noteId == null) return;
        final note = state.notes.firstWhere((e) => e.id == noteId);
        _state = state.copyWith(newNote: note);
        return;
      case ToggleSearch(:final search):
        _state = state.copyWith(search: search ?? !state.search);
      case ToggleTheme():
        final theme = state.theme == ThemeMode.light 
          ? ThemeMode.dark : ThemeMode.light;
        _state = state.copyWith(theme: theme);
      case CheckPassword(:final password):
        final result = _repository.checkPassword(password);
        _state = _state.copyWith(password: result);
    }
    notifyListeners();
  }

}