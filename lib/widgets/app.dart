import 'package:darkruby/notes_viewmodel.dart';
import 'package:darkruby/widgets/password_page.dart';
import 'package:flutter/material.dart';

const String _appName = 'Dark Ruby';

class App extends StatelessWidget {
  App({super.key});
  
  final viewModel = MainViewmodel();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewModel,
      builder: (context, _) {
        return MaterialApp(
          title: _appName,
          debugShowCheckedModeBanner: false,
          home: PasswordPage(viewModel: viewModel),
          theme: .new(
            colorScheme: .light(
              primary: Colors.red.shade900,
              onPrimary: Colors.white,
              secondary: Colors.white70,
              onSecondary: Colors.black87,
              primaryContainer: Colors.white70,
              secondaryContainer: Colors.white
            ),
            visualDensity: .adaptivePlatformDensity
          ),
          darkTheme: .new(
            colorScheme: .dark(
              primary: Colors.red.shade900,
              onPrimary: Colors.white,
              secondary: Colors.black87,
              onSecondary: Colors.white70,
              primaryContainer: const Color.fromARGB(255, 25, 25, 25),
              secondaryContainer: const Color.fromARGB(255, 20, 20, 20)
            ),
            visualDensity: .adaptivePlatformDensity
          ),
          themeMode: viewModel.state.theme,
        );
      }
    );
  }
}
