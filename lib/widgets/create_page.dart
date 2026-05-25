import 'package:darkruby/extensions.dart';
import 'package:darkruby/notes_viewmodel.dart';
import 'package:darkruby/note_intent.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  final MainViewmodel viewModel;
  const CreatePage({super.key, required this.viewModel});
  
  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  final TextEditingController titleController = .new();
  final TextEditingController dateController = .new();
  final TextEditingController textController = .new();

  @override
  void initState() {
    super.initState();
    final state = widget.viewModel.state;
    final date = state.newNote!.date;
    dateController.text = date.toPtBrDateTime();
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
        title: Text('Create Note'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: (){
              widget.viewModel.onAction(UpdateNote(
                title: titleController.text,
                text: textController.text
              ));
              widget.viewModel.onAction(SaveNote());
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
              decoration: .new(
                border: .none,
                labelText: 'Title',
                floatingLabelBehavior: .always,
                labelStyle: .new(
                  color: scheme.primary, 
                  fontWeight: .w600,
                  fontSize: 18,

                ),
                hintText: 'Type a title...',
              )),
            TextField(
              readOnly: true,
              controller: dateController,
              decoration: .new(
                border: .none,
                labelText: 'Date',
                floatingLabelBehavior: .always,
                labelStyle: .new(
                  color: scheme.primary, 
                  fontWeight: .w600,
                  fontSize: 18,
                ),
                hintText: 'Type a date...',
              )
            ),
            Expanded(
              child: TextField(
                maxLines: null,
                readOnly: false,
                controller: textController,
                decoration: .new(
                  border: .none,
                  labelText: 'Text',
                  floatingLabelBehavior: .always,
                  labelStyle: .new(
                    color: scheme.primary,
                    fontWeight: .w600,
                    fontSize: 18,
                  ),
                  hintText: 'Type a text...',
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}