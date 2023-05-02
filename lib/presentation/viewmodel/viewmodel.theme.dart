import "package:beer_app/infrastructure/services/service.theme.dart";
import "package:flutter/material.dart";

class ThemeViewModel extends ChangeNotifier {
  final ThemeService _themeService;

  ThemeViewModel(this._themeService);

  void changeTheme(BuildContext context) {
    if (_themeService.currentTheme.value == ThemeMode.system || _themeService.currentTheme.value == ThemeMode.light) {
      _themeService.setTheme(ThemeMode.dark);
    }
    else if(_themeService.currentTheme.value == ThemeMode.dark) {
      _themeService.setTheme(ThemeMode.light);
    }
  }
}
