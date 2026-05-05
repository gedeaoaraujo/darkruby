sealed class NoteIntent {}
class SaveNote extends NoteIntent {}
class LoadNotes extends NoteIntent {}
class CreateNote extends NoteIntent {}
class ToggleReadOnly extends NoteIntent {}

class DeleteNote extends NoteIntent {
  final int noteId;
  DeleteNote({required this.noteId});
}

class UpdateNote extends NoteIntent {
  String? title, date, text;
  UpdateNote({this.title, this.date, this.text});
}