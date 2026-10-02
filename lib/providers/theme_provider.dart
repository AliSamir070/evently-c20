import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  // 1) Important data for observers
  // 2) A way to change the value if this data (function)
  ThemeMode themeMode = ThemeMode.light;

  changeTheme(ThemeMode newTheme){
    if(themeMode == newTheme) return;
    themeMode = newTheme;
    notifyListeners();
  }

}