import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:translate_app/src/providers/app.dart';
import 'package:translate_app/src/utils/theme.dart';


Widget appBar(BuildContext context,AppProvider appState){
  return AppBar(
    backgroundColor: Theme.of(context).backgroundColor,
    automaticallyImplyLeading: false,
    elevation: 0,
    centerTitle: true,
    title: Stack(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Translate',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 30.0,
                color: Colors.black
              ),
            ),
            Text(
              '.',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 30.0,
                color: Colors.green,
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Spacer(
              flex: 11,
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () {
                  CustomTheme.changeTheme(context);
                },
                icon: Icon(
                  appState.currentTheme != ThemeData.dark()
                      ? Icons.brightness_2
                      : Icons.brightness_high,
                  color: CustomTheme.colorIconTheme(context),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}