import 'package:darkruby/model/note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditPage extends ConsumerWidget {
  final Note note;
  final bool viewMode;
  final _pageTitle = 'Edit Page';
  
  const EditPage({
    super.key,
    this.viewMode = true, 
    this.note = const Note()
  });

  TextEditingController get titleController => .fromValue(.new(
    text: note.title,
    selection: .collapsed(offset: note.title.length),
  ));

  TextEditingController get dateController => .fromValue(.new(
    text: note.date,
    selection: .collapsed(offset: note.date.length),
  ));

  TextEditingController get textController => .fromValue(.new(
    text: note.text,
    selection: .collapsed(offset: note.text.length),
  ));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.inversePrimary,
      appBar: AppBar(
        title: Text(_pageTitle),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: (){}
          )
        ],
      ),
      body: Padding(
        padding: const .all(16.0),
        child: Expanded(
          child: Column(
            children: [
              TextField(
                readOnly: viewMode,
                controller: titleController,
                decoration: .new(
                  border: .none,
                  labelText: 'Título',
                )),
              TextField(
                readOnly: viewMode,
                controller: dateController,
                decoration: .new(
                  border: .none,
                  labelText: 'Data',
                )
              ),
              Expanded(
                child: TextField(
                  maxLines: null,
                  readOnly: viewMode,
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