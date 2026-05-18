import 'package:darkruby/note_intent.dart';
import 'package:darkruby/notes_viewmodel.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final MainViewmodel viewModel;

  const SettingsPage(this.viewModel, {super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int? _selectedValue = 0;

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
            RadioGroup<int>(
              groupValue: _selectedValue,
              onChanged: (int? value) {
                widget.viewModel.onAction(ToggleTheme());
                setState(() => _selectedValue = value);
              },
              child: Column(
                children: <Widget>[
                  RadioListTile<int>(
                    value: 0, 
                    minTileHeight: 0,
                    horizontalTitleGap: 0,
                    title: const Text('Dark'),
                    contentPadding: EdgeInsets.all(0),
                  ),
                  RadioListTile<int>(
                    value: 1, 
                    minTileHeight: 0,
                    horizontalTitleGap: 0,
                    title: const Text('Light'),
                    contentPadding: EdgeInsets.all(0),
                  ),
                ],
              ),
            ),
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