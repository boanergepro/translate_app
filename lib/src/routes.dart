import 'package:flutter/material.dart';
import 'package:translate_app/src/screens/splash_screen.dart';
import 'package:translate_app/src/screens/welcome_screen.dart';
import 'package:translate_app/src/screens/home_screen.dart';
import 'package:translate_app/src/screens/example.dart';
import 'package:translate_app/src/screens/item_favorite_screen.dart';


final routes = {
  SplashScreen.routerName : (BuildContext context) => SplashScreen(),
  WelcomeScreen.routerName : (BuildContext context) => WelcomeScreen(),
  HomeScreen.routerName : (BuildContext context) => HomeScreen(),
  Translate.routerName : (BuildContext context) => Translate(),
  ItemFavoriteScreen.routerName : (BuildContext context) => ItemFavoriteScreen(),
};