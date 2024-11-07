import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_apper/constants/note_colors.dart';
import 'package:note_apper/data/todo_database.dart';
import 'package:note_apper/models/to_do.dart';
import 'package:note_apper/widget/dialog_widget.dart';
import 'package:note_apper/widget/note_list_view_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final noteBox = Hive.box('noteBox');
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    super.initState();

    if (noteBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
  }

  final TextEditingController noteController = TextEditingController();

  void checkBoxChanged(int index) {
    setState(() {
      db.toDoList[index].toggleCompletion();
    });

    db.updateDatabase();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogWidget(
            controller: noteController,
            onSave: saveNewTask,
            onCancel: cancelNewTask,
          );
        });
  }

  void saveNewTask() {
    if (noteController.text.isNotEmpty) {
      final newTask = noteController.text;
      setState(() {
        db.toDoList.add(ToDo(task: newTask, isCompleted: false));
      });

      db.updateDatabase();
    }
    noteController.clear();
    Navigator.of(context).pop();
  }

  void cancelNewTask() {
    noteController.clear();
    Navigator.of(context).pop();
  }

  void deleteTask(ToDo toDoTask) {
    // 取出 index，用來指定恢復被刪除的資料位置
    // 必須要在刪除前取出，否則會變 -1
    final toDoIndex = db.toDoList.indexOf(toDoTask);

    setState(() {
      db.toDoList.remove(toDoTask);
    });
    db.updateDatabase();
    // 找不到會變 -1
    if (toDoIndex != -1) {
      // 先清除目前畫面上的 SnackBars
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 3),
          content: const Text('撕除便條紙中'),
          action: SnackBarAction(
              label: '貼回去',
              onPressed: () {
                setState(() {
                  db.toDoList.insert(toDoIndex, toDoTask);
                });
                db.updateDatabase();
              }),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 1),
          content: Text('已撕下便條紙'),
        ),
      );
    }
  }

  void saveTask() {
    db.updateDatabase();
  }

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('小便貼'),
        shadowColor: Colors.yellow[200],
        elevation: 5,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.amber,
        child: Icon(
          Icons.add,
          color: NoteColors.titleColor,
        ),
      ),
      body: NoteListViewWidget(
        noteList: db.toDoList,
        deleteTask: deleteTask,
        checkBoxChanged: checkBoxChanged,
        saveTask: saveTask,
      ),
    );
  }
}
