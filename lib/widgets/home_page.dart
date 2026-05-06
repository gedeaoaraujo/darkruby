import 'package:darkruby/widgets/create_page.dart';
import 'package:darkruby/widgets/list_item.dart';
import 'package:darkruby/note_intent.dart';
import 'package:darkruby/widgets/note_page.dart';
import 'package:darkruby/notes_viewmodel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String title;
  final NotesViewmodel viewModel;

  const HomePage({
    super.key,
    required this.title,
    required this.viewModel
  });
  
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: scheme.primary,
        title: Text(title),
      ),
      body: ListenableBuilder(
        listenable: viewModel,
        builder:(context, child) {
          return ListView.builder(
            itemCount: viewModel.state.notes.length,
            itemBuilder: (_, index){
              final item = viewModel.state.notes[index];
              return ListItem(
                key: ValueKey('$index'), note: item, goToNotePage: (){
                  Navigator.push(context, MaterialPageRoute<void>(
                    builder: (context) => NotePage(
                      noteId: item.id,
                      viewModel: viewModel
                    )
                  ));
                }
              );
            }
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: scheme.secondary,
        child: Icon(Icons.add, color: scheme.onSecondary),
        onPressed: (){
          viewModel.onAction(CreateNote());
          Navigator.push(context, MaterialPageRoute<void>(
            builder: (context) => CreatePage(viewModel: viewModel),
          ));
        }
      ),
    );
  }
}
