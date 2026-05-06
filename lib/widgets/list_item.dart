import 'package:darkruby/model/note.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final Note note;
  final void Function() goToNotePage;

  const ListItem(
    this.goToNotePage,
    {super.key, required this.note}
  );

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const .new(.infinity, 0),
        shape: RoundedRectangleBorder(borderRadius: .circular(8))
      ),
      onPressed: () => goToNotePage(),
      child: SizedBox(
        width: .infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            spacing: 2,
            mainAxisSize: .max,
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
                  maxLines: 3,
                  overflow: .ellipsis,
                  style: .new(color: scheme.onSecondary),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}