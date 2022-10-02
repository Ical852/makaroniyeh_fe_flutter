// @dart=2.9

import 'package:flutter/material.dart';
import 'package:makaroniyeh/pages/home.dart';
import 'package:makaroniyeh/pages/splash.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/" : (context) => SplashPage(),
        "/home" : (context) => HomePage()
      },
    );
  }
}