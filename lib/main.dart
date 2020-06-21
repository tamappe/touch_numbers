import 'package:flutter/material.dart';
import 'package:twentyfive/pages/clear_page.dart';
import 'package:twentyfive/pages/game_play_page.dart';
import 'package:twentyfive/pages/start_page.dart';
import 'package:twentyfive/utils/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Constants.startRoute,
      routes: <String, WidgetBuilder>{
        Constants.startRoute: (BuildContext context) => StartPage(),
        Constants.playRoute: (BuildContext context) => GamePlayPage(),
        Constants.clearRoute: (BuildContext context) => ClearPage(),
      },
      title: 'Numbers',
      theme: new ThemeData(
        fontFamily: 'Arial',
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.white,
      ),
    );
  }
}
