import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translate_app/src/providers/app.dart';

import 'package:translate_app/src/routes.dart';
import 'package:translate_app/src/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (context) => AppProvider()),
      ],
      child: App(),
    );
  }
}
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppProvider>(context);

    return MaterialApp(
      routes: routes,
      theme: appState.currentTheme,
      home: SplashScreen(),
    );
  }
}
