import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dark_mode.dart';
import 'light_mode.dart';

class ThemeNotifier extends Notifier<ThemeData> {
  @override
  ThemeData build() {
    // Initialize theme based on the system theme
    final brightness = WidgetsBinding.instance.window.platformBrightness;
    return brightness == Brightness.dark ? darkMode : lightMode;
  }

  void toggleTheme() {
    state = (state == lightMode) ? darkMode : lightMode;
  }

  bool get isDarkMode => state == darkMode;
}

final themeNotifierProvider = NotifierProvider<ThemeNotifier, ThemeData>(() {
  return ThemeNotifier(); // Ensure this is a concrete class extending Notifier
});
