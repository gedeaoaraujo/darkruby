import 'package:flutter/material.dart';
import 'package:darkruby/note_intent.dart';
import 'package:darkruby/notes_viewmodel.dart';

class NotePage extends StatefulWidget {

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
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {

  @override
  void initState() {
    widget.viewModel.onAction(ToggleReadOnly(readOnly: true));
    super.initState();
  }

  @override
  void dispose() {
    widget.titleController.dispose();
    widget.dateController.dispose();
    widget.textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: scheme.onPrimary,
        backgroundColor: scheme.primary,
        title: switch(widget.viewModel.state.readOnly){
          true => Text('View Note'),
          false => Text('Edit Note'),
        },
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: (){},
          ),
          IconButton(
            icon: switch(widget.viewModel.state.readOnly){
              true => Icon(Icons.edit),
              false => Icon(Icons.remove_red_eye),
            },
            onPressed: (){
              widget.viewModel.onAction(ToggleReadOnly());
            }
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: (){
              widget.viewModel.onAction(DeleteNote(noteId: widget.noteId));
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
              readOnly: widget.viewModel.state.readOnly,
              controller: widget.titleController,
              onChanged: (value) {
                widget.titleController.text = value;
              },
              decoration: .new(
                border: .none,
                labelText: 'Título',
              )),
            TextField(
              readOnly: widget.viewModel.state.readOnly,
              controller: widget.dateController,
              onChanged: (value) {
                widget.dateController.text = value;
              },
              decoration: .new(
                border: .none,
                labelText: 'Data',
              )
            ),
            Expanded(
              child: TextField(
                maxLines: null,
                readOnly: widget.viewModel.state.readOnly,
                controller: widget.textController,
                onChanged: (value) {
                  widget.textController.text = value;
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
        widget.viewModel.state.readOnly == true ? null :
          FloatingActionButton(
            onPressed: (){
              widget.viewModel.onAction(UpdateNote(
                title: widget.titleController.text,
                date: widget.dateController.text,
                text: widget.textController.text
              ));
              widget.viewModel.onAction(SaveNote());
              widget.viewModel.onAction(ToggleReadOnly());
            },
            backgroundColor: scheme.primary,
            child: Icon(Icons.check, color: scheme.onPrimary)
          )
    );
  }
}