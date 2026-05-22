import 'dart:io';
import 'dart:convert';
import 'package:csv/csv.dart';
import 'package:darkruby/model/note.dart';
import 'package:darkruby/types.dart';
import 'package:path/path.dart';
import 'package:archive/archive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';

Future<void> exportNotesCsvZip(List<AnyMap> list) async {
  try {
    final keys = list.first.keys.toList();
    final values = list.map((e) => e.values.toList());
    final dados = [keys, ...values];

    final csvString = csv.encode(dados);
    final csvBytes = utf8.encode(csvString);

    final archive = Archive();
    // final date = DateTime.now();
    // final dateStr = date.toIso8601String();
    final fileName = 'notes-123456';

    archive.addFile(ArchiveFile(
      '$fileName.csv', csvBytes.length, csvBytes
    ));

    final dir = await getDownloadsDirectory();
    final path = join(dir!.path, '$fileName.zip');

    final zipBytes = ZipEncoder().encode(archive);
    final zipFile = File(path);
    await zipFile.writeAsBytes(zipBytes);
  } catch (error) {
    print(error);
  }
}

Future<void> importNoteCsvZip() async {
  try {
    final dir = await getDownloadsDirectory();
    final path = join(dir!.path, 'notes-123456.zip');
    
    final zipFile = File(path);
    final zipBytes = await zipFile.readAsBytes();
    final archive = ZipDecoder().decodeBytes(zipBytes);

    final notes = archive.files
      .where((f) => f.name.endsWith('.csv'))
      .map((file) => file.content)
      .map((content) => utf8.decode(content))
      .map((decoded) => Csv(
        dynamicTyping: true,
        parseHeaders: true
      ).decode(decoded))
      .map((notes) => notes.map((data)=> Note(
        id: data[0], title: data[1],
        date: data[2], text: data[3]
      )).toList())
      .expand((notes) => notes)
      .toList();

    print(notes);
  } catch (error) {
    print(error);
  }
    
}

Future<String> selectFile() async {
  final result = await FilePicker.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['zip']
  );
  if (result == null) {
    print('File section canceled');
    return '';
  }

  final path = result.files.single.path;
  if (path != null) {
    final file = File(path);
    print('File selected: ${file.path}');
    return file.path;
  }

  return '';
}