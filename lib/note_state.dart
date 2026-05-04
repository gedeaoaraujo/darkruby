import 'package:darkruby/model/note.dart';
import 'package:darkruby/note_page.dart';

class NoteState {
  final bool readOnly;
  final List<Note> notes;
  final PageType pageType;
  
  NoteState({
    this.readOnly = true,
    this.notes = const [],
    this.pageType = PageType.edit
  });

  NoteState copyWith({
    bool? readOnly,
    List<Note>? notes,
    PageType? pageType,
  }) => NoteState(
    notes: notes ?? this.notes,
    readOnly: readOnly ?? this.readOnly,
    pageType: pageType ?? this.pageType
  );
}

sealed class NoteIntent {}
class LoadNotes extends NoteIntent {}
class ToggleReadOnly extends NoteIntent {}