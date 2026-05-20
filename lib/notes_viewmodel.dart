import 'package:darkruby/model/note.dart';
import 'package:darkruby/note_intent.dart';
import 'package:darkruby/note_state.dart';
import 'package:flutter/material.dart';
import 'package:darkruby/main_repository.dart';

class MainViewmodel extends ChangeNotifier {
  final MainRepository _repository = .new();
  
  MainState _state = .new();
  MainState get state => _state;
  
  MainViewmodel() {
    onAction(LoadNotes());
  }

  Future<void> onAction(MainIntent intent) async {
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
        final result = await _repository.checkPassword(password);
        _state = _state.copyWith(password: result);
      case SavePassword(:final password):
        await _repository.updatePassword(password);
        return;
    }
    notifyListeners();
  }

}