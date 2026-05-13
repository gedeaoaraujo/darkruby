import 'package:darkruby/notes_viewmodel.dart';
import 'package:darkruby/widgets/home_page.dart';
import 'package:flutter/material.dart';

const String _appName = 'Dark Ruby';

class App extends StatelessWidget {
  App({super.key});
  
  final viewModel = NotesViewmodel();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewModel,
      builder: (context, _) {
        return MaterialApp(
          title: _appName,
          debugShowCheckedModeBanner: false,
          home: HomePage(title: _appName, viewModel: viewModel),
          theme: .new(
            colorScheme: .light(
              primary: Colors.red.shade900,
              onPrimary: Colors.white,
              secondary: Colors.white70,
              onSecondary: Colors.black87,
            ),
          ),
          darkTheme: .new(
            colorScheme: .dark(
              primary: Colors.red.shade900,
              onPrimary: Colors.white,
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
