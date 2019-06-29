import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static final routerName = '/splash_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Translate',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 50.0,
              ),
            ),
            Text(
              '.',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 50.0,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
