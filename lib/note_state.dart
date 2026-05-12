import 'package:darkruby/model/note.dart';

class NoteState {
  final bool search;
  final Note? newNote;
  final bool readOnly;
  final List<Note> notes;
  
  NoteState({
    this.newNote,
    this.search = false,
    this.readOnly = true,
    this.notes = const [],
  });

  NoteState copyWith({
    bool? search,
    Note? newNote,
    bool? readOnly,
    List<Note>? notes,
  }) => NoteState(
    notes: notes ?? this.notes,
    search: search ?? this.search,
    newNote: newNote ?? this.newNote,
    readOnly: readOnly ?? this.readOnly,
  );
}
