import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  bool isThemeDark = false;

  void changeTheme(bool value)
  {
    isThemeDark = value;
    notifyListeners();
  }
}