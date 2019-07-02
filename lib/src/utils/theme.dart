import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translate_app/src/providers/app.dart';

class CustomTheme {

  // Change value theme in provider
  static changeTheme(BuildContext context) {
    final appState = Provider.of<AppProvider>(context);
    appState.currentTheme != ThemeData.dark()
        ? appState.currentTheme = ThemeData.dark()
        : appState.currentTheme = null;
  }

  // get color icon from theme
  static Color colorIconTheme(BuildContext context) {
    final appState = Provider.of<AppProvider>(context);

    return appState.currentTheme != ThemeData.dark() ? Colors.white : Colors
        .greenAccent;
  }
}