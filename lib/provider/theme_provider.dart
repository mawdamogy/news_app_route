import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currenttheme = ThemeMode.dark;
  changetheme(newtheme) {
    if (currenttheme == newtheme) {
      return;
    }
    currenttheme = newtheme;
    notifyListeners();
  }
}
