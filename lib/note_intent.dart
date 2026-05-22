sealed class MainIntent {}
class SaveNote extends MainIntent {}
class LoadNotes extends MainIntent {}
class CreateNote extends MainIntent {}
class ExportNotes extends MainIntent {}

class ImportNotes extends MainIntent {
  final String path;
  ImportNotes(this.path);
}

class ToggleTheme extends MainIntent {
  final bool? dark;
  ToggleTheme({this.dark});
}

class SavePassword extends MainIntent {
  final String password;
  SavePassword(this.password);
}

class CheckPassword extends MainIntent {
  final String password;
  CheckPassword(this.password);
}

class ToggleSearch extends MainIntent {
  final bool? search;
  ToggleSearch({this.search});
}

class ToggleReadOnly extends MainIntent {
  final bool? readOnly;
  ToggleReadOnly({this.readOnly});
}

class SelectNote extends MainIntent {
  final int? noteId;
  SelectNote({required this.noteId});
}

class DeleteNote extends MainIntent {
  final int? noteId;
  DeleteNote({required this.noteId});
}

class UpdateNote extends MainIntent {
  String? title, date, text;
  UpdateNote({this.title, this.date, this.text});
}