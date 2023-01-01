// ignore_for_file: unnecessary_null_comparison, prefer_conditional_assignment

import 'package:flutter/material.dart';

class LanguageManager {
  static LanguageManager get instance {
    LanguageManager _instance = LanguageManager._init();
    return _instance;
  }

  LanguageManager._init();

  final trLocale = const Locale("tr", "TR");

  List<Locale> get supportedLocals => [trLocale];
}
