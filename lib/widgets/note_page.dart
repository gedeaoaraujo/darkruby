import 'package:flutter/material.dart';
import 'package:darkruby/note_intent.dart';
import 'package:darkruby/notes_viewmodel.dart';

class NotePage extends StatelessWidget {

  late final int noteId;
  late final NotesViewmodel viewModel;
  late final TextEditingController titleController;
  late final TextEditingController dateController;
  late final TextEditingController textController;
  
  NotePage({super.key, required this.noteId, required this.viewModel}){
    viewModel.onAction(SelectNote(noteId: noteId));
    titleController = .new(text: viewModel.state.newNote?.title ?? '');
    dateController = .new(text: viewModel.state.newNote?.date ?? '');
    textController = .new(text: viewModel.state.newNote?.text ?? '');
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child){
        return Scaffold(
          appBar: AppBar(
            foregroundColor: scheme.onPrimary,
            backgroundColor: scheme.primary,
            title: switch(viewModel.state.readOnly){
              true => Text('View Note'),
              false => Text('Edit Note'),
            },
            actions: [
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: (){
                  viewModel.onAction(DeleteNote(noteId: noteId));
                  Navigator.pop(context);
                }
              ),
              IconButton(
                icon: switch(viewModel.state.readOnly){
                  true => Icon(Icons.edit),
                  false => Icon(Icons.remove_red_eye),
                },
                onPressed: (){
                  viewModel.onAction(ToggleReadOnly());
                }
              )
            ],
          ),
          body: Padding(
            padding: const .all(16.0),
            child: Column(
              children: [
                TextField(
                  readOnly: viewModel.state.readOnly,
                  controller: titleController,
                  onChanged: (value) {
                    viewModel.onAction(UpdateNote(title: value));
                  },
                  decoration: .new(
                    border: .none,
                    labelText: 'Título',
                  )),
                TextField(
                  readOnly: viewModel.state.readOnly,
                  controller: dateController,
                  onChanged: (value) {
                    viewModel.onAction(UpdateNote(date: value));
                  },
                  decoration: .new(
                    border: .none,
                    labelText: 'Data',
                  )
                ),
                Expanded(
                  child: TextField(
                    maxLines: null,
                    readOnly: viewModel.state.readOnly,
                    controller: textController,
                    onChanged: (value) {
                      viewModel.onAction(UpdateNote(text: value));
                    },
                    decoration: .new(
                      border: .none,
                      labelText: 'Texto',
                    )
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton:
            viewModel.state.readOnly == true ? null :
              FloatingActionButton(
                onPressed: (){
                  viewModel.onAction(SaveNote());
                  viewModel.onAction(ToggleReadOnly());
                },
                backgroundColor: scheme.primary,
                child: Icon(Icons.check, color: scheme.onPrimary)
              )
        );
      }
    );
  }
}