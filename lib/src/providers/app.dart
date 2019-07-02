import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  ThemeData _currentTheme;
  String _languageFrom;
  String _languageTo;

  AppProvider() {
    _languageFrom = null;
    _languageTo = null;
    _currentTheme = ThemeData(
      backgroundColor: Colors.grey[300],
      buttonColor: Colors.green,
    );

  }

  ThemeData get currentTheme => _currentTheme;
  String get languageFrom => _languageFrom;
  String get languageTo => _languageTo;

  set currentTheme(value) {
    _currentTheme = value != ThemeData.dark() ? ThemeData(
      backgroundColor: Colors.grey[300],
      buttonColor: Colors.green,
    ) : ThemeData.dark();

    notifyListeners();
  }

  set languageFrom(value) {
    _languageFrom = value;
    notifyListeners();
  }

  set languageTo(value) {
    _languageTo = value;
    notifyListeners();
  }

}

