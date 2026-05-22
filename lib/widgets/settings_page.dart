import 'package:darkruby/note_intent.dart';
import 'package:darkruby/notes_viewmodel.dart';
import 'package:darkruby/widgets/password_dialog.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final MainViewmodel viewModel;

  const SettingsPage(this.viewModel, {super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  void openPassDialog() => showDialog(
    context: context, 
    builder: (BuildContext context) => PasswordDialog((password){
      widget.viewModel.onAction(SavePassword(password));
    })
  );

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
            Text('Theme', style: .new(
              fontSize: 18,
              fontWeight: .w500,
              color: scheme.primary,
            )),
            RadioGroup<bool>(
              groupValue: widget.viewModel.state.theme.isLight,
              onChanged: (bool? dark) {
                widget.viewModel.onAction(ToggleTheme(dark: dark));
              },
              child: Column(
                children: <Widget>[
                  RadioListTile<bool>(
                    value: false, 
                    minTileHeight: 0,
                    horizontalTitleGap: 8,
                    title: const Text('Dark'),
                    contentPadding: EdgeInsets.all(0),
                  ),
                  RadioListTile<bool>(
                    value: true, 
                    minTileHeight: 0,
                    horizontalTitleGap: 8,
                    title: const Text('Light'),
                    contentPadding: EdgeInsets.all(0),
                  ),
                ],
              ),
            ),
            Divider(color: scheme.onSecondary),

            Text('Language', style: .new(
              fontSize: 18,
              fontWeight: .w500,
              color: scheme.primary,
            )),
            TextButton(
              onPressed: (){},
              style: .new(
                padding: .all(.zero)
              ),
              child: Text(
                'Select Language',
                style: .new(
                  fontSize: 16,
                  fontWeight: .normal,
                  color: scheme.onSurface,
                )
              ),
            ),
            Divider(color: scheme.onSecondary),
            
            Text('Password', style: .new(
              fontSize: 18,
              fontWeight: .w500,
              color: scheme.primary, 
            )),
            TextButton(
              onPressed: () => openPassDialog(),
              style: .new(
                padding: .all(.zero)
              ),
              child: Text('Modify Password', style: .new(
                fontSize: 16,
                fontWeight: .normal,
                color: scheme.onSurface,
              )),
            ),
            Divider(color: scheme.onSecondary),
            
            Text('Backup', style: .new(
              fontSize: 18,
              fontWeight: .w500,
              color: scheme.primary,
            )),
            TextButton(
              onPressed: () {
                widget.viewModel.onAction(ExportNotes());
              },
              style: .new(
                padding: .all(.zero)
              ),
              child: Text(
                'Export Notes',
                style: .new(
                  fontSize: 16,
                  color: scheme.onSurface,
                  fontWeight: .normal,
                )
              ),
            ),
            TextButton(
              onPressed: (){
                widget.viewModel.onAction(ImportNotes());
              },
              style: .new(
                padding: .all(.zero)
              ),
              child: Text(
                'Import Notes',
                style: .new(
                  fontSize: 16,
                  color: scheme.onSurface,
                  fontWeight: .normal,
                )
              ),
            ),
          ],
        ),
      )
    );
  }
  
}