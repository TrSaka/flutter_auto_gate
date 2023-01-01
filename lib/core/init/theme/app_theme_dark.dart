// ignore_for_file: unnecessary_null_comparison, prefer_conditional_assignment

import 'package:flutter/material.dart';
import 'app_theme.dart';

mixin AppThemeDark implements ThemeData {
  static AppThemeDark? _instance;

  static ThemeData get theme => ThemeData(
        appBarTheme: AppBarTheme(color: Colors.black),
      );
}
