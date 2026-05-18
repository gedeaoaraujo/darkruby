import 'package:darkruby/model/note.dart';
import 'package:flutter/material.dart';

class MainState {
  final bool search;
  final Note? newNote;
  final bool readOnly;
  final bool password;
  final ThemeMode theme;
  final List<Note> notes;
  
  MainState({
    this.newNote,
    this.password = false,
    this.search = false,
    this.readOnly = true,
    this.notes = const [],
    this.theme = ThemeMode.dark,
  });

  MainState copyWith({
    bool? search,
    Note? newNote,
    bool? readOnly,
    bool? password,
    ThemeMode? theme,
    List<Note>? notes,
  }) => MainState(
    theme: theme ?? this.theme,
    notes: notes ?? this.notes,
    search: search ?? this.search,
    newNote: newNote ?? this.newNote,
    password: password ?? this.password,
    readOnly: readOnly ?? this.readOnly,
  );
}
