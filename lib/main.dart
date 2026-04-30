import 'package:darkruby/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const App()));
}

const String _appName = 'Dark Ruby';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appName,
      debugShowCheckedModeBanner: false,
      home: const HomePage(title: _appName),
      theme: ThemeData(
        colorScheme: .dark(
          primary: Colors.redAccent,
          inversePrimary: Colors.black,
        ),
      ),
    );
  }
}
