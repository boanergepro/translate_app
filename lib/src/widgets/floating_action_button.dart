import 'package:flutter/material.dart';

Widget floatingActionButton(BuildContext context){
  return Theme(
    data: Theme.of(context).copyWith(
      highlightColor: Colors.white,
    ),
    child: FloatingActionButton(
      onPressed: () {},
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