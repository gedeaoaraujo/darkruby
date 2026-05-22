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
  final MainViewmodel viewModel;

  const HomePage({
    super.key,
    required this.title,
    required this.viewModel
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late final TextEditingController searchController;

  List<Note> get filteredNotes {
    final text = searchController.text;
    return widget.viewModel.state.notes
      .where((note) => note.containText(text)).toList();
  }

  @override
  void initState() {
    super.initState();
    searchController = .new()
      ..addListener(() => setState((){}));
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void goToNotePage(Note item) {
    searchController.clear();
    widget.viewModel.onAction(ToggleSearch(search: false));
    widget.viewModel.onAction(ToggleReadOnly(readOnly: true));
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
      builder: (context) => SettingsPage(widget.viewModel)
    ));
  }

  @override
  Widget build(BuildContext context) {
    final notes = filteredNotes;
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: scheme.secondaryContainer,
      appBar: AppBar(
        foregroundColor: scheme.onPrimary,
        backgroundColor: scheme.primary,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: switch(widget.viewModel.state.theme){
              ThemeMode.light => Icon(Icons.dark_mode),
              ThemeMode.dark => Icon(Icons.light_mode),
              ThemeMode.system => Icon(Icons.light_mode)
            },
            onPressed: (){
              widget.viewModel.onAction(ToggleTheme());
            }
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              searchController.clear(); setState((){});
              widget.viewModel.onAction(ToggleSearch());
            }
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
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
                autofocus: true,
                controller: searchController,
                decoration: .new(hintText: 'Text to filter...'),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: notes.length,
                itemBuilder: (_, index){
                  final item = notes[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 2.0
                    ),
                    child: ListItem(
                      key: ValueKey(item.id),
                      note: item, () => goToNotePage(item)
                    ),
                  );
                }
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'buttonAdd',
        onPressed: goToCreatePage,
        backgroundColor: scheme.primary,
        child: Icon(Icons.add, color: scheme.onPrimary)
      ),
    );
  }
}
