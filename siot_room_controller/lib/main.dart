import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/open_place.dart';
import 'screens/townhall.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/the_big_place_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF02616B), //or set color with: Color(0xFF0000FF)
    ));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Lato',
        primaryColor: Color(0xff007C89),
        highlightColor: Color(0xFF02616B), // Color for Scrollbar.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => SplashScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        TheBigPlaceScreen.routeName: (ctx) => TheBigPlaceScreen(),
        Townhall.routeName: (ctx) => Townhall(),
        OpenPlace.routeName: (ctx) => OpenPlace(),
      },
    );
  }
}
