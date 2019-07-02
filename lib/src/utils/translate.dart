import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translate_app/src/providers/app.dart';

class Translate {
  static exchangeLanguages (BuildContext context) {
    final appState = Provider.of<AppProvider>(context);

    String from = appState.languageFrom;
    String to = appState.languageTo;
    appState.languageFrom = to;
    appState.languageTo = from;
  }
}