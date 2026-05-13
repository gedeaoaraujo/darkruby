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
                titleController.text = value;
              },
              decoration: .new(
                border: .none,
                labelText: 'Título',
              )),
            TextField(
              readOnly: viewModel.state.readOnly,
              controller: dateController,
              onChanged: (value) {
                dateController.text = value;
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
                  textController.text = value;
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
              viewModel.onAction(UpdateNote(
                title: titleController.text,
                date: dateController.text,
                text: textController.text
              ));
              viewModel.onAction(SaveNote());
              viewModel.onAction(ToggleReadOnly());
            },
            backgroundColor: scheme.primary,
            child: Icon(Icons.check, color: scheme.onPrimary)
          )
    );
  }
}