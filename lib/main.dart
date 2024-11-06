import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_apper/constants/note_theme.dart';
import 'package:note_apper/models/to_do.dart';
import 'package:note_apper/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ToDoAdapter());
  await Hive.openBox('noteBox');
  runApp(const NoteApper());
}

class NoteApper extends StatelessWidget {
  const NoteApper({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: NoteTheme.lightTheme,
    );
  }
}
