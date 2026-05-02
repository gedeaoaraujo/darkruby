import 'package:darkruby/note_page.dart';
import 'package:darkruby/injections.dart';
import 'package:darkruby/list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  final String title;

  const HomePage({super.key, required this.title});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;
    final state = ref.watch(notesViewModel);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: scheme.primary,
        title: Text(title),
      ),
      body: Builder(
        builder: (_) => ListView.builder(
          itemCount: state.notes.length,
          itemBuilder: (_, index){
            final item = state.notes[index];
            return ListItem(note: item);
          }
        ) 
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: scheme.secondary,
        child: Icon(Icons.add, color: scheme.onSecondary),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute<void>(
            builder: (context) => NotePage(
              pageTitle: 'Create Note', 
              viewMode: false
            ),
          ));
        }
      ),
    );
  }
}
