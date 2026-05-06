import 'package:flutter/material.dart';
import 'package:darkruby/injections.dart';
import 'package:darkruby/model/note.dart';
import 'package:darkruby/note_intent.dart';
import 'package:darkruby/notes_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum PageType {
  view, edit, create
}

class NotePage extends ConsumerStatefulWidget {
  final int noteId;
  const NotePage({super.key, this.noteId = -1});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NotePage();
}

class _NotePage extends ConsumerState<NotePage> {

  late final NotesViewmodel viewModel;
  late TextEditingController titleController;
  late TextEditingController dateController;
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    viewModel = ref.read(notesViewModel.notifier);
    
    final state = ref.read(notesViewModel);
    final selecNote = state.notes.firstWhere(
      (e) => e.id == widget.noteId, orElse: () => Note()
    );

    titleController = .new(text: selecNote.title);
    dateController = .new(text: selecNote.date);
    textController = .new(text: selecNote.text);
  }

  @override
  void dispose() {
    titleController.dispose();
    dateController.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final state = ref.watch(notesViewModel);
    final page = switch (state.readOnly) {
      true => (title: 'View Note', icon: Icons.edit),
      false => (title: 'Edit Note', icon: Icons.remove_red_eye),
    };
    return Scaffold(
      appBar: AppBar(
        backgroundColor: scheme.primary,
        title: Text(page.title),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: (){
              viewModel.onAction(DeleteNote(noteId: widget.noteId));
              Navigator.pop(context);
            }
          ),
          IconButton(
            icon: Icon(page.icon),
            onPressed: (){
              viewModel.onAction(ToggleReadOnly());
            }
          )
        ],
      ),
      body: Padding(
        padding: const .all(16.0),
        child: Expanded(
          child: Column(
            children: [
              TextField(
                readOnly: state.readOnly,
                controller: titleController,
                decoration: .new(
                  border: .none,
                  labelText: 'Título',
                )),
              TextField(
                readOnly: state.readOnly,
                controller: dateController,
                decoration: .new(
                  border: .none,
                  labelText: 'Data',
                )
              ),
              Expanded(
                child: TextField(
                  maxLines: null,
                  readOnly: state.readOnly,
                  controller: textController,
                  decoration: .new(
                    border: .none,
                    labelText: 'Texto',
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}