import 'package:darkruby/injections.dart';
import 'package:darkruby/note_intent.dart';
import 'package:darkruby/note_state.dart';
import 'package:darkruby/notes_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatePage extends ConsumerStatefulWidget {
  const CreatePage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreatePage();
}

class _CreatePage extends ConsumerState<CreatePage> {

  late final NoteState state;
  late final NotesViewmodel viewModel;
  late final TextEditingController titleController;
  late final TextEditingController dateController;
  late final TextEditingController textController;

  @override
  void initState() {
    super.initState();
    state = ref.read(notesViewModel);
    viewModel = ref.read(notesViewModel.notifier);
    titleController = .new(text: state.newNote?.title ?? '');
    dateController = .new(text: state.newNote?.date ?? '');
    textController = .new(text: state.newNote?.text ?? '');
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

   return Scaffold(
      appBar: AppBar(
        backgroundColor: scheme.primary,
        title: Text('Create Note'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: (){
              Navigator.pop(context);
              viewModel.onAction(SaveNote());
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
                readOnly: false,
                controller: titleController,
                onChanged: (text){
                  viewModel.onAction(UpdateNote(title: text));
                },
                decoration: .new(
                  border: .none,
                  labelText: 'Título',
                )),
              TextField(
                readOnly: false,
                controller: dateController,
                onChanged: (text){
                  viewModel.onAction(UpdateNote(date: text));
                },
                decoration: .new(
                  border: .none,
                  labelText: 'Data',
                )
              ),
              Expanded(
                child: TextField(
                  maxLines: null,
                  readOnly: false,
                  onChanged: (text){
                    viewModel.onAction(UpdateNote(text: text));
                  },
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