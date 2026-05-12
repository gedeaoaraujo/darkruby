import 'package:darkruby/notes_viewmodel.dart';
import 'package:darkruby/widgets/home_page.dart';
import 'package:flutter/material.dart';

const String _appName = 'Dark Ruby';

class App extends StatefulWidget {
  const App({super.key});
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final viewModel = NotesViewmodel();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return MaterialApp(
          title: _appName,
          debugShowCheckedModeBanner: false,
          home: HomePage(title: _appName, viewModel: viewModel),
          theme: ThemeData(
            colorScheme: .light(
              primary: Colors.red.shade900,
              onPrimary: Colors.white,
              secondary: Colors.white70,
              onSecondary: Colors.black87,
            ),
          ),
          darkTheme: ThemeData(
            colorScheme: .dark(
              primary: Colors.red.shade900,
              onPrimary: Colors.black,
              secondary: Colors.black87,
              onSecondary: Colors.white70,
            ),
          ),
          themeMode: viewModel.state.theme,
        );
      }
    );
  }
}
