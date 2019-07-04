import 'package:flutter/material.dart';

Widget bottomAppBar() {
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
            onPressed: () {},
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
