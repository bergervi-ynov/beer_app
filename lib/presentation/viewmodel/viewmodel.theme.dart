import "package:beer_app/infrastructure/services/theme.service.dart";
import "package:flutter/material.dart";

class ThemeViewModel extends ChangeNotifier {
  final ThemeService _themeService;

  ThemeViewModel(this._themeService);

  void changeTheme(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.light) {
      _themeService.setTheme(ThemeMode.dark);
      return;
    }
    _themeService.setTheme(ThemeMode.light);
  }
}
