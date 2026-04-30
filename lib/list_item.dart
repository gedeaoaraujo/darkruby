import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String title;
  final String date;
  final String text;

  const ListItem({
    super.key,
    required this.title, 
    required this.date, 
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(title, textAlign: .start),
          Text(date),
          Wrap(children: [Text(text)]),
        ],
      ),
    );
  }
}