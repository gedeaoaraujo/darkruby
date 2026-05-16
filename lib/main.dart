import 'package:darkruby/database/sql_database.dart';
import 'package:darkruby/widgets/app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SqlDatabase.init();
  runApp(App());
}
