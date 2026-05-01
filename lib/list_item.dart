import 'package:darkruby/model/note.dart';
import 'package:flutter/material.dart';
import 'package:darkruby/edit_page.dart';

class ListItem extends StatelessWidget {
  final Note note;

  const ListItem({
    super.key,
    required this.note
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute<void>(
            builder: (context) => EditPage(note: note,),
          ));
        },
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(note.title, textAlign: .start),
            Text(note.date),
            Wrap(children: [Text(note.text)]),
          ],
        ),
      ),
    );
  }
}