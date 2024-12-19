import 'package:flutter/material.dart';
import 'package:note_apper/models/to_do.dart';
import 'package:note_apper/widget/note_widget.dart';

class NoteListViewWidget extends StatefulWidget {
  const NoteListViewWidget(
      {super.key,
      required this.noteList,
      required this.deleteTask,
      required this.checkBoxChanged,
      required this.saveTask});

  final List<ToDo> noteList;
  final Function(ToDo) deleteTask;
  final Function(int) checkBoxChanged;
  final VoidCallback saveTask;

  @override
  State<NoteListViewWidget> createState() => _NoteListViewWidgetState();
}

class _NoteListViewWidgetState extends State<NoteListViewWidget> {
  @override
  Widget build(BuildContext context) {
    final noteList = widget.noteList;
    return ReorderableListView(
      children: [
        for (int index = 0; index < noteList.length; index++)
          Dismissible(
            key: ValueKey(noteList[index]),
            background: Container(
              color: Colors.amber,
              margin: const EdgeInsets.only(top: 24, right: 24),
              child: const Icon(Icons.delete),
            ),
            onDismissed: (direction) => widget.deleteTask(noteList[index]),
            child: NoteWidget(
              task: noteList[index].task,
              isCompleted: noteList[index].isCompleted,
              onChanged: (_) => widget.checkBoxChanged(index),
            ),
          )
      ],
      onReorder: (oldIndex, newIndex) {
        setState(() {
          // 目標被拖走了，所以要插入的列表數會少1，所以newIndex要-1位置才會正確
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final item = noteList.removeAt(oldIndex);
          noteList.insert(newIndex, item);
        });
        widget.saveTask();
      },
    );
  }
}
