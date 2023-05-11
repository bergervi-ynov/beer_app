import "package:beer_app/infrastructure/services/service.theme.dart";
import "package:flutter/material.dart";

class ThemeViewModel extends ChangeNotifier {
  final ThemeService _themeService;

  ThemeViewModel(this._themeService){
    if (ThemeMode.system == Brightness.light) {
      _themeService.currentTheme.value = ThemeMode.light;
    }
    else {
      _themeService.currentTheme.value = ThemeMode.dark;
    }
  }

  void changeTheme(BuildContext context) {
    if ( _themeService.currentTheme.value == ThemeMode.light) {
      _themeService.setTheme(ThemeMode.dark);
    }
    else if(_themeService.currentTheme.value == ThemeMode.dark) {
      _themeService.setTheme(ThemeMode.light);
    }
  }
}
