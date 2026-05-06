import 'package:darkruby/model/note.dart';

class NoteState {
  final Note? newNote;
  final bool readOnly;
  final List<Note> notes;
  
  NoteState({
    this.newNote,
    this.readOnly = true,
    this.notes = const [],
  });

  NoteState copyWith({
    bool? readOnly,
    List<Note>? notes,
    Note? newNote,
  }) => NoteState(
    notes: notes ?? this.notes,
    readOnly: readOnly ?? this.readOnly,
    newNote: newNote ?? this.newNote
  );
}
