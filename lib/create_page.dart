import 'package:darkruby/injections.dart';
import 'package:darkruby/note_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatePage extends ConsumerWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;
    final state = ref.watch(notesViewModel);
    final viewModel = ref.read(notesViewModel.notifier);

    final titleController = TextEditingController.fromValue(.new(
      text: state.newNote?.title ?? '',
      selection: .collapsed(offset: state.newNote?.title.length ?? 0),
    ));

    final dateController = TextEditingController.fromValue(.new(
      text: state.newNote?.date ?? '',
      selection: .collapsed(offset: state.newNote?.date.length ?? 0),
    ));

    final textController = TextEditingController.fromValue(.new(
      text: state.newNote?.text ?? '',
      selection: .collapsed(offset: state.newNote?.text.length ?? 0),
    ));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: scheme.primary,
        title: Text('Create Note'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: (){
              Navigator.pop(context);
              viewModel.onAction(SaveNote());
            }
          )
        ],
      ),
      body: Padding(
        padding: const .all(16.0),
        child: Expanded(
          child: Column(
            children: [
              TextField(
                readOnly: false,
                controller: titleController,
                onChanged: (text){
                  viewModel.onAction(UpdateNote(title: text));
                },
                decoration: .new(
                  border: .none,
                  labelText: 'Título',
                )),
              TextField(
                readOnly: false,
                controller: dateController,
                onChanged: (text){
                  viewModel.onAction(UpdateNote(date: text));
                },
                decoration: .new(
                  border: .none,
                  labelText: 'Data',
                )
              ),
              Expanded(
                child: TextField(
                  maxLines: null,
                  readOnly: false,
                  onChanged: (text){
                    viewModel.onAction(UpdateNote(text: text));
                  },
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