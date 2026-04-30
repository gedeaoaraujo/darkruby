import 'package:darkruby/list_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String genStrs(){
    final chars = List.generate(255, (_) => 'x');
    return chars.join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListItem(text: genStrs()),
            ListItem(text: genStrs()),
            ListItem(text: genStrs()),
          ],
        ),
      )
    );
  }
}
