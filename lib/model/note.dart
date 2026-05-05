class Note {
  final int id;
  final String title;
  final String date;
  final String text;

  const Note({
    this.id = 0,
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
}
