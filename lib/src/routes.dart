import 'package:flutter/material.dart';
import 'package:translate_app/src/screens/splash_screen.dart';
import 'package:translate_app/src/screens/welcome_screen.dart';


final routes = {
  SplashScreen.routerName : (BuildContext context) => SplashScreen(),
  WelcomeScreen.routerName : (BuildContext context) => WelcomeScreen()
};