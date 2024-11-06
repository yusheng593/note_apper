import 'package:hive/hive.dart';

part 'to_do.g.dart';

@HiveType(typeId: 0)
class ToDo {
  ToDo({
    required this.task,
    required this.isCompleted,
  });
  @HiveField(0)
  final String task;
  @HiveField(1)
  bool isCompleted;

  void toggleCompletion() {
    isCompleted = !isCompleted;
  }
}
