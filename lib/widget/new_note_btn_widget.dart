import 'package:flutter/material.dart';

class NewNoteBtnWidget extends StatelessWidget {
  const NewNoteBtnWidget(
      {super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
