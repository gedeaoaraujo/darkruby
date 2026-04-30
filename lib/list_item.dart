import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  final String title;
  final String date; 
  final String text;

  const ListItem({
    super.key,
    this.text = '',
    this.title = 'Title',
    this.date = '30/04/2026',
  });

  @override
  State<StatefulWidget> createState() => _ListItem();
}

class _ListItem extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(widget.title, textAlign: .start),
          Text(widget.date),
          Wrap(children: [Text(widget.text)]),
        ],
      ),
    );
  }
}