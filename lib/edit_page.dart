import 'package:darkruby/model/note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditPage extends ConsumerWidget {
  final Note note;
  final bool editable;
  final _pageTitle = 'Edit Page';
  
  const EditPage({
    super.key, 
    this.editable = false, 
    this.note = const Note()
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.inversePrimary,
      appBar: AppBar(title: Text(_pageTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              enabled: editable,
              controller: .fromValue(TextEditingValue(
                text: note.title,
                selection: TextSelection.collapsed(offset: note.title.length),
              )),
              decoration: InputDecoration(
              border: .none,
              labelText: 'Título',
            )),
            TextField(
              enabled: false,
              controller: .fromValue(TextEditingValue(
                text: note.date,
                selection: TextSelection.collapsed(offset: note.date.length),
              )),
              decoration: InputDecoration(
                border: .none,
                labelText: 'Data',
              )
            ),
            Expanded(
              child: TextField(
                maxLines: null,
                enabled: editable,
                controller: .fromValue(TextEditingValue(
                  text: note.text,
                  selection: TextSelection.collapsed(offset: note.text.length),
                )),
                decoration: InputDecoration(
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