import 'package:darkruby/notes_viewmodel.dart';
import 'package:darkruby/note_intent.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatelessWidget {

  late final NotesViewmodel viewModel;
  final TextEditingController titleController = .new();
  final TextEditingController dateController = .new();
  final TextEditingController textController = .new();

  CreatePage({super.key, required this.viewModel});

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
              viewModel.onAction(UpdateNote(
                title: titleController.text,
                date: dateController.text,
                text: textController.text
              ));
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
                titleController.text = text;
              },
              decoration: .new(
                border: .none,
                labelText: 'Título',
              )),
            TextField(
              readOnly: false,
              controller: dateController,
              onChanged: (text){
                dateController.text = text;
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
                  textController.text = text;
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