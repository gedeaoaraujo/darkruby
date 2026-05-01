import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditPage extends ConsumerWidget {
  final int noteId;
  final _pageTitle = 'Edit Page';
  const EditPage({super.key, this.noteId = 0});

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
            TextField(decoration: InputDecoration(
              border: .none,
              labelText: 'Título',
            )),
            TextField(
              enabled: false,
              decoration: InputDecoration(
                border: .none,
                labelText: '22/05/2026',
                hintText: 'Data'
              )
            ),
            Expanded(
              child: TextField(
                maxLines: null,
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