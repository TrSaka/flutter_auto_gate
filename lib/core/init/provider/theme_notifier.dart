import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_system/core/constants/enums/app_theme_enum.dart';
import 'package:flutter_system/core/init/theme/app_theme_light.dart';
import '../theme/app_theme_dark.dart';

//CHANGE PROVIDER TO RIVERPOD !
final themeProvider = ChangeNotifierProvider((ref) => ThemeNotifier());

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.theme; //theme at now !
  ThemeData get currentTheme => _currentTheme;

  void changeAppTheme(AppThemes theme) {
    if (theme == AppThemes.LIGHT) {
      _currentTheme = AppThemeLight.theme;
      notifyListeners();
    } else {
      _currentTheme = AppThemeDark.theme;
      notifyListeners();
    }
  }
}
