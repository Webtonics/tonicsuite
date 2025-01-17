import 'package:flutter/material.dart';

class MyErrorDialog extends StatelessWidget {
  const MyErrorDialog({
    super.key,
    required this.title,
    required this.content,
    // required this.icon,
  });
  final String title;
  final String content;
  // final IconData icon;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titleTextStyle: const TextStyle(color: Colors.red, fontSize: 20),
      icon: const Icon(Icons.warning),
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK"))
      ],
    );
  }
}