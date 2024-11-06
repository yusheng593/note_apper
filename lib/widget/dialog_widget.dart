import 'package:flutter/material.dart';
import 'package:note_apper/constants/note_colors.dart';
import 'package:note_apper/widget/new_note_btn_widget.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: NoteColors.appBarBackgroundColor,
      content: SizedBox(
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextField(
              controller: controller,
              autofocus: true,
              decoration: InputDecoration(
                  hintText: '新增 ...',
                  hintStyle: TextStyle(
                      color: Theme.of(context).colorScheme.primaryContainer)),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NewNoteBtnWidget(text: '取消', onPressed: onCancel),
                NewNoteBtnWidget(text: '貼上', onPressed: onSave),
              ],
            )
          ],
        ),
      ),
    );
  }
}
