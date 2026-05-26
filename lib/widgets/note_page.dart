import 'package:darkruby/extensions.dart';
import 'package:darkruby/widgets/date_container.dart';
import 'package:flutter/material.dart';
import 'package:darkruby/note_intent.dart';
import 'package:darkruby/notes_viewmodel.dart';
import 'package:share_plus/share_plus.dart';

class NotePage extends StatefulWidget {
  final int? noteId;
  final MainViewmodel viewModel;
  
  NotePage({super.key, required this.noteId, required this.viewModel}){
    viewModel.onAction(SelectNote(noteId: noteId));
  }

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  
  late final TextEditingController titleController;
  late final TextEditingController textController;

  String get getDate {
    final note = widget.viewModel.state.newNote;
    return note?.date ?? '';
  }

  @override
  void initState() {
    final note = widget.viewModel.state.newNote;
    titleController = .new(text: note?.title ?? '');
    textController = .new(text: note?.text ?? '');
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    textController.dispose();
    super.dispose();
  }

  String get bodyText {
    final title = titleController.text;
    final date = getDate.toPtBrDateTime();
    final text = textController.text;
    return '$title\n''$date\n''$text';
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.viewModel.state;
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: scheme.secondaryContainer,
      appBar: AppBar(
        foregroundColor: scheme.onPrimary,
        backgroundColor: scheme.primary,
        title: switch(state.readOnly){
          true => Text('View Note'),
          false => Text('Edit Note'),
        },
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () async {
              await SharePlus.instance.share(
                ShareParams(
                  title: titleController.text,
                  text: bodyText,
                ),
              );
            },
          ),
          IconButton(
            icon: switch(state.readOnly){
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
      body: SingleChildScrollView(
        padding: const .all(16.0),
        child: Column(
          children: [
            DateContainer(getDate, state.readOnly),
            TextField(
              readOnly: state.readOnly,
              controller: titleController,
              decoration: .new(
                border: .none,
                labelText: 'Title',
                labelStyle: .new(
                  color: scheme.primary,
                  fontWeight: .w600,
                  fontSize: 18,
                )
              )),
            TextField(
              maxLines: null,
              readOnly: state.readOnly,
              controller: textController,
              decoration: .new(
                border: .none,
                labelText: 'Text',
                labelStyle: .new(
                  color: scheme.primary,
                  fontWeight: .w600,
                  fontSize: 18,
                )
              )
            ),
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: state.readOnly.not(),
        child: FloatingActionButton(
          heroTag: 'buttonCheck',
          onPressed: (){
            widget.viewModel.onAction(UpdateNote(
              title: titleController.text,
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