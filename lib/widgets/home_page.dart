import 'package:darkruby/model/note.dart';
import 'package:darkruby/widgets/create_page.dart';
import 'package:darkruby/widgets/list_item.dart';
import 'package:darkruby/note_intent.dart';
import 'package:darkruby/widgets/note_page.dart';
import 'package:darkruby/notes_viewmodel.dart';
import 'package:darkruby/widgets/settings_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;
  final NotesViewmodel viewModel;
  final TextEditingController searchController = .new();

  HomePage({
    super.key,
    required this.title,
    required this.viewModel
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Iterable<Note> get filteredNotes {
    final text = widget.searchController.text;
    return widget.viewModel.state.notes
      .where((note) => note.containText(text));
  }

  @override
  void dispose() {
    widget.searchController.dispose();
    super.dispose();
  }

  void goToNotePage(Note item) {
    widget.viewModel.onAction(ToggleSearch(search: false));
    Navigator.push(context, MaterialPageRoute<void>(
      builder: (context) => NotePage(
        noteId: item.id,
        viewModel: widget.viewModel
      )
    ));
  }

  void goToCreatePage(){
    widget.viewModel.onAction(ToggleSearch(search: false));
    widget.viewModel.onAction(CreateNote());
    Navigator.push(context, MaterialPageRoute<void>(
      builder: (context) => CreatePage(viewModel: widget.viewModel),
    ));
  }

  void goToSettings(){
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => SettingsPage()
    ));
  }

  @override
  Widget build(BuildContext context) {
    final notes = filteredNotes;
    final scheme = Theme.of(context).colorScheme;
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
              setState(()=> widget.searchController.text = '');
              widget.viewModel.onAction(ToggleSearch());
            }
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: ()=> goToSettings()
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
                controller: widget.searchController,
                decoration: .new(hintText: 'Text to filter...'),
                onChanged: (value){
                  setState(()=> widget.searchController.text = value);
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
