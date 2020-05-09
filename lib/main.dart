import 'package:flutter/material.dart';
import 'package:twentyfive/pages/play_page.dart';
import 'package:twentyfive/pages/start_page.dart';
import 'package:twentyfive/utils/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/start',
      routes: <String, WidgetBuilder> {
        Constants.startRoute: (BuildContext context) => StartPage(),
        Constants.playRoute: (BuildContext context) => PlayPage(),
      },
      title: 'Numbers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

