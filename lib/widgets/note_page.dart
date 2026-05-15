import 'package:flutter/material.dart';
import 'package:darkruby/note_intent.dart';
import 'package:darkruby/notes_viewmodel.dart';

class NotePage extends StatefulWidget {
  final int noteId;
  final NotesViewmodel viewModel;
  
  NotePage({super.key, required this.noteId, required this.viewModel}){
    viewModel.onAction(SelectNote(noteId: noteId));
  }

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  
  late final TextEditingController titleController;
  late final TextEditingController dateController;
  late final TextEditingController textController;

  @override
  void initState() {
    final note = widget.viewModel.state.newNote;
    titleController = .new(text: note?.title ?? '');
    dateController = .new(text: note?.date ?? '');
    textController = .new(text: note?.text ?? '');
    super.initState();
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
      backgroundColor: scheme.secondaryContainer,
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
              controller: titleController,
              decoration: .new(
                border: .none,
                labelText: 'Título',
                labelStyle: .new(
                  color: scheme.primary,
                  fontWeight: .w600,
                  fontSize: 18,
                )
              )),
            TextField(
              readOnly: widget.viewModel.state.readOnly,
              controller: dateController,
              decoration: .new(
                border: .none,
                labelText: 'Data',
                labelStyle: .new(
                  color: scheme.primary, 
                  fontWeight: .w600,
                  fontSize: 18,
                )
              )
            ),
            Expanded(
              child: TextField(
                maxLines: null,
                readOnly: widget.viewModel.state.readOnly,
                controller: textController,
                decoration: .new(
                  border: .none,
                  labelText: 'Texto',
                  labelStyle: .new(
                    color: scheme.primary,
                    fontWeight: .w600,
                    fontSize: 18,
                  )
                )
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: !widget.viewModel.state.readOnly,
        child: FloatingActionButton(
          heroTag: 'buttonCheck',
          onPressed: (){
            widget.viewModel.onAction(UpdateNote(
              title: titleController.text,
              date: dateController.text,
              text: textController.text
            ));
            widget.viewModel.onAction(SaveNote());
            widget.viewModel.onAction(ToggleReadOnly());
          },
          backgroundColor: scheme.primary,
          child: Icon(Icons.check, color: scheme.onPrimary)
        )
      )
    );
  }
}