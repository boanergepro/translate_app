import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  bool _loading;
  bool _error;
  ThemeData _currentTheme;
  String _languageFrom;
  String _languageTo;
  String _currentText;
  String _translatedText;

  //Constructor
  AppProvider() {
    _error = false;
    _loading = false;
    _languageFrom = null;
    _languageTo = null;
    _currentTheme = ThemeData(
      backgroundColor: Colors.grey[300],
      buttonColor: Colors.green,
    );
    _currentText = '';
    _translatedText = 'Translated text';
  }

  // Getters
  bool get error => _error;

  bool get loading => _loading;

  ThemeData get currentTheme => _currentTheme;

  String get languageFrom => _languageFrom;

  String get languageTo => _languageTo;

  String get currentText => _currentText;

  String get translatedText => _translatedText;

  // Setters
  set error(value) {
    _error = value;
    notifyListeners();
  }

  set loading(value) {
    _loading = value;
    notifyListeners();
  }

  set currentTheme(value) {
    _currentTheme = value != ThemeData.dark()
        ? ThemeData(
            backgroundColor: Colors.grey[300],
            buttonColor: Colors.green,
          )
        : ThemeData.dark();

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

  set currentText(value) {
    _currentText = value;
  }

  set translatedText(value) {
    _translatedText = value;
    notifyListeners();
  }
}
