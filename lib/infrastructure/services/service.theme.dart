import "package:flutter/material.dart";

class ThemeService {
  final ValueNotifier<ThemeMode> currentTheme;

  ThemeService({required this.currentTheme});

  void setTheme(ThemeMode theme) {
    currentTheme.value = theme;
  }
}
