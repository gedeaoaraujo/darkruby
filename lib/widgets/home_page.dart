import 'package:darkruby/model/note.dart';
import 'package:darkruby/widgets/create_page.dart';
import 'package:darkruby/widgets/list_item.dart';
import 'package:darkruby/note_intent.dart';
import 'package:darkruby/widgets/note_page.dart';
import 'package:darkruby/notes_viewmodel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;
  final NotesViewmodel viewModel;

  const HomePage({
    super.key,
    required this.title,
    required this.viewModel
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = .new();

  bool searchFilter(Note note){
    return note.title.contains(searchController.text)
      || note.date.contains(searchController.text)
      || note.text.contains(searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final notes = widget.viewModel.state.notes.where(searchFilter);

    void goToNotePage(Note item) {
      Navigator.push(context, MaterialPageRoute<void>(
        builder: (context) => NotePage(
          noteId: item.id,
          viewModel: widget.viewModel
        )
      ));
    }

    void goToCreatePage(){
      widget.viewModel.onAction(CreateNote());
      Navigator.push(context, MaterialPageRoute<void>(
        builder: (context) => CreatePage(viewModel: widget.viewModel),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        foregroundColor: scheme.onPrimary,
        backgroundColor: scheme.primary,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.sunny),
            onPressed: (){
              widget.viewModel.onAction(ToggleTheme());
            }
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              widget.viewModel.onAction(ToggleSearch());
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
            if (widget.viewModel.state.search) Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0, horizontal: 24.0
              ),
              child: TextField(
                controller: searchController,
                onChanged: (value){
                  setState((){ searchController.text = value; });
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: notes.length,
                itemBuilder: (_, index){
                  final item = notes.elementAt(index);
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
