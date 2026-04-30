import 'package:darkruby/list_item.dart';
import 'package:darkruby/notes_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final notesViewModel = 
  StateNotifierProvider<NotesViewmodel, NoteState>(
    (ref) => NotesViewmodel()
);

class HomePage extends ConsumerWidget {
  final String title;

  const HomePage({super.key, required this.title});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final state = ref.watch(notesViewModel);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Builder(
          builder: (_) => ListView.builder(
            itemCount: state.notes.length,
            itemBuilder: (_, index){
              final item = state.notes[index];
              return ListItem(
                title: item.title,
                date: item.date,
                text: item.text,
              );
            }
          ) 
        ),
      ),
    );
  }
}
