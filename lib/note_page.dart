import 'package:darkruby/injections.dart';
import 'package:darkruby/model/note.dart';
import 'package:darkruby/note_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum PageType {
  view, edit, create
}

class NotePage extends ConsumerWidget {
  final int noteId;
  final PageType pageType;
  
  const NotePage({
    super.key,
    this.noteId = -1,
    this.pageType = PageType.edit
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;
    final state = ref.watch(notesViewModel);
    final viewModel = ref.read(notesViewModel.notifier);
    final selecNote = state.notes.firstWhere(
      (e) => e.id == noteId, orElse: () => Note()
    );

    final titleController = TextEditingController.fromValue(.new(
      text: selecNote.title,
      selection: .collapsed(offset: selecNote.title.length),
    ));

    final dateController = TextEditingController.fromValue(.new(
      text: selecNote.date,
      selection: .collapsed(offset: selecNote.date.length),
    ));

    final textController = TextEditingController.fromValue(.new(
      text: selecNote.text,
      selection: .collapsed(offset: selecNote.text.length),
    ));

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