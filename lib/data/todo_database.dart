import 'package:hive/hive.dart';
import 'package:note_apper/models/to_do.dart';

class TodoDatabase {
  List<ToDo> toDoList = [];

  final _noteBox = Hive.box('noteBox');

  void createInitialData() {
    toDoList = [ToDo(task: '點擊右下新增便條', isCompleted: false)];
  }

  void loadData() {
    var storedList = _noteBox.get('TODOLIST', defaultValue: []);
    toDoList = List<ToDo>.from(storedList.map((item) => item as ToDo));
  }

  void updateDatabase() {
    _noteBox.put('TODOLIST', toDoList);
  }
}
