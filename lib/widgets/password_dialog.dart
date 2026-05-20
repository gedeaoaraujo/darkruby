import 'package:flutter/material.dart';

class PasswordDialog extends StatefulWidget {
  final Function(String) onUpdatePass;
  const PasswordDialog(this.onUpdatePass, {super.key});

  @override
  State<PasswordDialog> createState() => _PasswordDialogState();
}

class _PasswordDialogState extends State<PasswordDialog> {
  bool showError = false;
  final TextEditingController _confirm = .new();
  final TextEditingController _password = .new();

  void onPressOK() {
    setState(() {
      showError = _password.text != _confirm.text;
    });
    
    if (showError) return;
    Navigator.pop(context);

    widget.onUpdatePass(_password.text);
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return AlertDialog(
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: const Text('Modify Password'),
      ),
      content: SizedBox(
        height: 180,
        child: Column(
          spacing: 32,
          children: [
            TextField(
              obscureText: true,
              controller: _password,
              decoration: .new(
                labelText: 'Password',
                floatingLabelBehavior: .always,
              ),
            ),
            TextField(
              obscureText: true,
              controller: _confirm,
              decoration: .new(
                labelText: 'Confirm password',
                floatingLabelBehavior: .always,
              ),
            ),
            if (showError) Text(
              'Passwords is not equals',
              style: .new(color: scheme.error)
            )
          ]
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: onPressOK,
          child: const Text('OK'),
        ),
      ],
    );
  }
}