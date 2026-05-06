import 'package:darkruby/model/note.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final Note note;
  final void Function() goToNotePage;

  const ListItem({
    super.key,
    required this.note,
    required this.goToNotePage
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton(
        onPressed: () => goToNotePage(),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              note.title, 
              textAlign: .start,
              style: .new(fontSize: 16),
            ),
            Text(
              note.date, 
              style: .new(color: scheme.onSecondary),
            ),
            Wrap(children: [
              Text(
                note.text, 
                maxLines: 5,
                overflow: .ellipsis,
                style: .new(color: scheme.onSecondary),
              )
            ]),
          ],
        ),
      ),
    );
  }
}