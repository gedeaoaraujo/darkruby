import 'package:darkruby/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dark Ruby',
      debugShowCheckedModeBanner: false,
      home: const HomePage(title: 'Dark Ruby'),
      theme: ThemeData(
        colorScheme: .dark(
          primary: Colors.redAccent,
          inversePrimary: Colors.black,
        ),
      ),
      // theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.black12)),
    );
  }
}
