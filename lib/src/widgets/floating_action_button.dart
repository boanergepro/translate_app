import 'package:flutter/material.dart';
import 'package:translate_app/src/screens/home_screen.dart';
import 'package:translate_app/src/utils/translate.dart';

Widget floatingActionButton({context, appState, translate}) {
  return Theme(
    data: Theme.of(context).copyWith(
      highlightColor: Colors.white,
    ),
    child: FloatingActionButton(
      onPressed: translate != null
          ? () {
              appState.currentText = translate;
              Translate.translator(context);
            }
          : () {
              Navigator.of(context).pushNamed(HomeScreen.routerName);
            },
      elevation: 0,
      backgroundColor: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.greenAccent[200],
          borderRadius: BorderRadius.circular(30),
        ),
        height: 45,
        width: 45,
        child: Icon(
          translate != null ? Icons.g_translate : Icons.home,
          color: Colors.white,
        ),
      ),
    ),
  );
}
