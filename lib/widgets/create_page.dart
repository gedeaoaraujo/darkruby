import 'package:darkruby/notes_viewmodel.dart';
import 'package:darkruby/note_intent.dart';
import 'package:darkruby/widgets/date_container.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  final MainViewmodel viewModel;
  const CreatePage({super.key, required this.viewModel});
  
  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  final TextEditingController titleController = .new();
  final TextEditingController textController = .new();

  String get getDate {
    final note = widget.viewModel.state.newNote;
    return note?.date ?? '';
  }

  @override
  void dispose() {
    titleController.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context);
    return Scaffold(
      backgroundColor: scheme.colorScheme.secondaryContainer,
      appBar: AppBar(
        foregroundColor: scheme.colorScheme.onPrimary,
        backgroundColor: scheme.colorScheme.primary,
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
            DateContainer(getDate, false),
            TextField(
              readOnly: false,
              controller: titleController,
              decoration: .new(
                border: .none,
                labelText: 'Title',
                floatingLabelBehavior: .always,
                labelStyle: .new(
                  fontWeight: .w600,
                  color: scheme.colorScheme.primary, 
                  fontSize: scheme.textTheme.titleLarge?.fontSize,
                ),
                hintText: 'Type a title...',
              ), style: .new(
                fontSize: scheme.textTheme.bodyMedium?.fontSize
              )),
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
                    fontWeight: .w600,
                    color: scheme.colorScheme.primary,
                    fontSize: scheme.textTheme.titleLarge?.fontSize,
                  ),
                  hintText: 'Type a text...',
                ),
                style: .new(
                  fontSize: scheme.textTheme.bodyMedium?.fontSize
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}