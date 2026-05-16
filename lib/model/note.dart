import 'package:darkruby/types.dart';

class Note {
  final int? id;
  final String title;
  final String date;
  final String text;

  bool get isInserted => id != 0;

  Note({
    this.id,
    this.title = '', 
    this.date = '', 
    this.text = ''
  });

  Note copyWith({
    int? id,
    String? title,
    String? date,
    String? text,
  }) => Note(
    id: id ?? this.id,
    title: title ?? this.title,
    date: date ?? this.date,
    text: text ?? this.text
  );

  bool containText(String txt){
    return title.toLowerCase().contains(txt.toLowerCase())
      || date.toLowerCase().contains(txt.toLowerCase())
      || text.toLowerCase().contains(txt.toLowerCase());
  }

  AnyMap toMap() => {
    'id': id,
    'date': date,
    'text': text,
    'title': title,
  };
}
