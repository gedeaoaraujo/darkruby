import 'package:darkruby/notes_viewmodel.dart';
import 'package:flutter_riverpod/legacy.dart';

final notesViewModel = 
  StateNotifierProvider<NotesViewmodel, NoteState>(
    (ref) => NotesViewmodel()
);
