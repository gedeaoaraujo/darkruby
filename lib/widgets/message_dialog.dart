import 'package:flutter/material.dart';

class MessageDialog extends StatelessWidget {
  final String message;
  const MessageDialog({
    super.key, required this.message
  });
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Message"),
      content: Text(message),
      actions: [
        TextButton(
          child: const Text('Ok'),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }
  
}