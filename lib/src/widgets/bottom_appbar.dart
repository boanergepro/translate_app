import 'package:flutter/material.dart';
import 'package:translate_app/src/screens/favorite_screen.dart';
import 'package:translate_app/src/screens/history_screen.dart';

Widget bottomAppBar({context, favorite, history}) {
  return BottomAppBar(
    child: Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: IconButton(
            icon: Icon(
              Icons.star_border,
              color: favorite != null ? Colors.greenAccent[200] : Colors.grey[300]
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(FavoriteScreen.routerName);
            },
          ),
        ),
        Spacer(
          flex: 2,
        ),
        Expanded(
          flex: 2,
          child: IconButton(
            icon: Icon(
              Icons.refresh, color: history != null ? Colors.greenAccent[200] : Colors.grey[300]
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(HistoryScreen.routerName);
            },
          ),
        ),
      ],
    ),
  );
}
