import 'package:flutter/material.dart';
import 'package:translate_app/src/screens/item_favorite_screen.dart';

Widget bottomAppBar(context) {
  return BottomAppBar(
    child: Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: IconButton(
            icon: Icon(
              Icons.star_border,
              color: Colors.grey[300],
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(ItemFavoriteScreen.routerName);
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
              Icons.refresh,
              color: Colors.grey[300],
            ),
            onPressed: () {},
          ),
        ),
      ],
    ),
  );
}
