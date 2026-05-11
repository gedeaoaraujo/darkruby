import 'package:darkruby/notes_viewmodel.dart';
import 'package:darkruby/note_intent.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatelessWidget {

  late final NotesViewmodel viewModel;
  late final TextEditingController titleController;
  late final TextEditingController dateController;
  late final TextEditingController textController;

  CreatePage({super.key, required this.viewModel}){
    titleController = .new(text: viewModel.state.newNote?.title ?? '');
    dateController = .new(text: viewModel.state.newNote?.date ?? '');
    textController = .new(text: viewModel.state.newNote?.text ?? '');
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
              viewModel.onAction(SaveNote());
              Navigator.pop(context);
            }
          )
        ],
      ),
      body: Padding(
        padding: const .all(16.0),
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
    );
  }
}