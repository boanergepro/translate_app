import 'package:flutter/material.dart';
import 'package:translate_app/src/screens/home_screen.dart';
import 'package:translate_app/src/utils/translate.dart';

Widget floatingActionButton({context,appState,translate, GlobalKey<ScaffoldState> key}){
  return Theme(
    data: Theme.of(context).copyWith(
      highlightColor: Colors.white,
    ),
    child: translate != null ? FloatingActionButton(
      onPressed: () {
        appState.currentText = translate;
        Translate.translator(context, key);
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
          Icons.g_translate,
          color: Colors.white,
        ),
      ),
    ) : FloatingActionButton(
      onPressed: () {
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
          Icons.home,
          color: Colors.white,
        ),
      ),
    ),
  );
}