sealed class NoteIntent {}
class SaveNote extends NoteIntent {}
class LoadNotes extends NoteIntent {}
class CreateNote extends NoteIntent {}
class ToggleTheme extends NoteIntent {}

class ToggleSearch extends NoteIntent {
  final bool? search;
  ToggleSearch({this.search});
}

class ToggleReadOnly extends NoteIntent {
  final bool? readOnly;
  ToggleReadOnly({this.readOnly});
}

class SelectNote extends NoteIntent {
  final int noteId;
  SelectNote({required this.noteId});
}

class DeleteNote extends NoteIntent {
  final int noteId;
  DeleteNote({required this.noteId});
}

class UpdateNote extends NoteIntent {
  String? title, date, text;
  UpdateNote({this.title, this.date, this.text});
}