import 'package:darkruby/note_intent.dart';
import 'package:darkruby/notes_viewmodel.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final NotesViewmodel viewModel;

  const SettingsPage(this.viewModel, {super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: scheme.onPrimary,
        backgroundColor: scheme.primary,
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 8,
          mainAxisSize: .max,
          crossAxisAlignment: .start,
          children: [
            Text('Theme', style: .new(color: scheme.primary, fontSize: 18)),
            Text('Dark', style: .new(color: scheme.onPrimary, fontSize: 16)),
            Text('Light', style: .new(color: scheme.onPrimary, fontSize: 16)),
            Divider(color: scheme.onSecondary),

            Text('Language', style: .new(color: scheme.primary, fontSize: 18)),
            Text('Select Language', style: .new(fontSize: 16)),
            Divider(color: scheme.onSecondary),
            
            Text('Password', style: .new(color: scheme.primary, fontSize: 18)),
            Text('Modify Password', style: .new(fontSize: 16)),
            Divider(color: scheme.onSecondary),
            
            Text('Backup', style: .new(color: scheme.primary, fontSize: 18)),
            Text('Export Notes', style: .new(fontSize: 16)),
            Text('Import Notes', style: .new(fontSize: 16)),
          ],
        ),
      )
    );
  }
  
}