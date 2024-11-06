import 'package:flutter/material.dart';
import 'package:note_apper/constants/note_colors.dart';

class NoteTheme {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: NoteColors.appBarBackgroundColor,
      foregroundColor: NoteColors.titleColor,
      elevation: 1,
    ),
    scaffoldBackgroundColor: NoteColors.scaffoldBackgroundColor,
    colorScheme: ColorScheme.light(
      primary: NoteColors.titleColor,
      primaryContainer: NoteColors.textColor,
      surface: NoteColors.scaffoldBackgroundColor,
      surfaceContainer: NoteColors.appBarBackgroundColor,
    ),
  );

  // static final ThemeData darkTheme = ThemeData.dark().copyWith(
  //   appBarTheme: AppBarTheme(
  //     backgroundColor: AppColors.dartAppBarBackgroundColor,
  //     foregroundColor: AppColors.dartTitleColor,
  //     elevation: 1,
  //   ),
  //   scaffoldBackgroundColor: const Color(0xFF2C2C2C),
  //   colorScheme: ColorScheme.dark(
  //     primary: AppColors.dartTitleColor,
  //     primaryContainer: AppColors.dartTextColor,
  //     surface: AppColors.dartScaffoldBackgroundColor,
  //     surfaceContainer: AppColors.dartAppBarBackgroundColor,
  //   ),
  // );
}
