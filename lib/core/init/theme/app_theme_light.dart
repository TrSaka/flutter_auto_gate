// ignore_for_file: unnecessary_null_comparison, prefer_conditional_assignment

import 'package:flutter/material.dart';
import 'package:flutter_system/core/utils/colors.dart';

import 'app_theme.dart';

mixin AppThemeLight implements ThemeData {
  static ThemeData get theme => ThemeData(
        backgroundColor: UIColor().backgroundColor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
        ),
        textTheme: TextTheme(
            titleMedium: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w200,
              color: UIColor().black,
            ),
            titleLarge: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: UIColor().backgroundColor,
            ),
            titleSmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: UIColor().black,
            )),
      );
}
