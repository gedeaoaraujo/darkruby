import 'package:darkruby/model/note.dart';
import 'package:darkruby/widgets/note_page.dart';

class NoteState {
  final Note? newNote;
  final bool readOnly;
  final List<Note> notes;
  final PageType pageType;
  
  NoteState({
    this.newNote,
    this.readOnly = true,
    this.notes = const [],
    this.pageType = PageType.edit
  });

  NoteState copyWith({
    bool? readOnly,
    List<Note>? notes,
    PageType? pageType,
    Note? newNote,
  }) => NoteState(
    notes: notes ?? this.notes,
    readOnly: readOnly ?? this.readOnly,
    pageType: pageType ?? this.pageType,
    newNote: newNote ?? this.newNote
  );
}
