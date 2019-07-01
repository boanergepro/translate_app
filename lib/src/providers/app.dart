import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  ThemeData _currentTheme;

  AppProvider() {
    _currentTheme = ThemeData(
      backgroundColor: Colors.grey[300],
      buttonColor: Colors.green,
    );
  }

  ThemeData get currentTheme => _currentTheme;

  set currentTheme(value) {
    _currentTheme = value != ThemeData.dark() ? ThemeData(
      backgroundColor: Colors.grey[300],
      buttonColor: Colors.green,
    ) : ThemeData.dark();

    notifyListeners();
  }
}

