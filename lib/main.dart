import 'package:darkruby/home_page.dart';
import 'package:darkruby/notes_viewmodel.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

const String _appName = 'Dark Ruby';

class App extends StatelessWidget {
  App({super.key});

  final viewModel = NotesViewmodel();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appName,
      debugShowCheckedModeBanner: false,
      home: HomePage(title: _appName, viewModel: viewModel),
      theme: ThemeData(
        colorScheme: .dark(
          primary: Colors.red.shade900,
          onPrimary: Colors.black,
          secondary: Colors.black87,
          onSecondary: Colors.white70,
        ),
      ),
    );
  }
}
