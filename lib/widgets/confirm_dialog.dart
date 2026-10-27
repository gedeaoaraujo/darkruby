import 'package:darkruby/widgets/settings_page.dart';
import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  final SettingsPage widget;
  final String message;
  final Function onOkPress;

  const ConfirmDialog({
    super.key,
    required this.widget,
    required this.message,
    required this.onOkPress,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
     title: const Text("Confirmation"),
     content: Text(message),
     actions: [
       TextButton(
         child: const Text('Cancel'),
         onPressed: () => Navigator.pop(context),
       ),
       TextButton(
         child: const Text('Ok'),
         onPressed: () {
            onOkPress();
            Navigator.pop(context);
         } 
       )
     ]);
  }
}