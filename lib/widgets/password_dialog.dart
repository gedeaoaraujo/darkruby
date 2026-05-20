import 'package:flutter/material.dart';

class PasswordDialog extends StatelessWidget {
  const PasswordDialog({
    super.key,
    required TextEditingController password,
    required TextEditingController confirm,
  }) : _password = password, _confirm = confirm;

  final TextEditingController _password;
  final TextEditingController _confirm;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: const Text('Modify Password'),
      ),
      content: SizedBox(
        height: 150,
        child: Column(
          spacing: 32,
          children: [
            TextField(
              controller: _password,
              decoration: .new(
                labelText: 'Password',
                floatingLabelBehavior: .always,
              ),
            ),
            TextField(
              controller: _confirm,
              decoration: .new(
                labelText: 'Confirm password',
                floatingLabelBehavior: .always,
              ),
            ),
          ]
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    );
  }
}