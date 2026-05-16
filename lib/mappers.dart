import 'package:darkruby/model/note.dart';
import 'package:darkruby/types.dart';

extension MapperNote on AnyMap {
  Note toNote() {
    return Note(
      id: this['id'] as int,
      date: this['date'] as String,
      text: this['text'] as String,
      title: this['title'] as String,
    );
  }
}