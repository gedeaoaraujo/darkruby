import 'package:darkruby/model/note.dart';
import 'package:darkruby/widgets/create_page.dart';
import 'package:darkruby/widgets/list_item.dart';
import 'package:darkruby/note_intent.dart';
import 'package:darkruby/widgets/note_page.dart';
import 'package:darkruby/notes_viewmodel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String title;
  final NotesViewmodel viewModel;
  static final TextEditingController searchController = .new();

  const HomePage({
    super.key,
    required this.title,
    required this.viewModel
  });
  
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    void goToNotePage(Note item) {
      Navigator.push(context, MaterialPageRoute<void>(
        builder: (context) => NotePage(
          noteId: item.id,
          viewModel: viewModel
        )
      ));
    }

    void goToCreatePage(){
      viewModel.onAction(CreateNote());
      Navigator.push(context, MaterialPageRoute<void>(
        builder: (context) => CreatePage(viewModel: viewModel),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        foregroundColor: scheme.onPrimary,
        backgroundColor: scheme.primary,
        title: Text(title),
        actions: [
          IconButton(
            icon: Icon(Icons.sunny),
            onPressed: (){
              viewModel.onAction(ToggleTheme());
            }
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              viewModel.onAction(ToggleSearch());
            }
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: (){}
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            if (viewModel.state.search) Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0, horizontal: 24.0
              ),
              child: TextField(
                controller: searchController,
                onChanged: (value){
                  searchController.text = value;
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.state.notes.length,
                itemBuilder: (_, index){
                  final item = viewModel.state.notes[index];
                  return ListItem(
                    key: ValueKey('$index'),
                    note: item, () => goToNotePage(item)
                  );
                }
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: goToCreatePage,
        backgroundColor: scheme.primary,
        child: Icon(Icons.add, color: scheme.onPrimary)
      ),
    );
  }
}
