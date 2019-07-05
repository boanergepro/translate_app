import 'package:flutter/material.dart';
import 'package:translate_app/src/screens/splash_screen.dart';
import 'package:translate_app/src/screens/welcome_screen.dart';
import 'package:translate_app/src/screens/home_screen.dart';
import 'package:translate_app/src/screens/favorite_screen.dart';
import 'package:translate_app/src/screens/history_screen.dart';


final routes = {
  SplashScreen.routerName : (BuildContext context) => SplashScreen(),
  WelcomeScreen.routerName : (BuildContext context) => WelcomeScreen(),
  HomeScreen.routerName : (BuildContext context) => HomeScreen(),
  FavoriteScreen.routerName : (BuildContext context) => FavoriteScreen(),
  HistoryScreen.routerName : (BuildContext context) => HistoryScreen(),

};