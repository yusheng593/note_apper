import 'package:flutter/material.dart';
import 'package:note_apper/constants/note_colors.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget(
      {super.key,
      required this.task,
      required this.isCompleted,
      required this.onChanged});

  final String task;
  final bool isCompleted;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: NoteColors.appBarBackgroundColor),
        child: Row(
          children: [
            Checkbox(value: isCompleted, onChanged: onChanged),
            Text(
              task,
              style: TextStyle(
                  decoration: isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  color: NoteColors.textColor,
                  fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
