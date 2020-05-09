import 'package:flutter/material.dart';
import 'package:twentyfive/pages/play_page.dart';
import 'package:twentyfive/utils/constants.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(color: Colors.black),
        child: Center(
          child: FlatButton(
            child: Text(
              'Start',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute<Null>(
                  settings: const RouteSettings(name: Constants.playRoute),
                  builder: (BuildContext context) => PlayPage(),
                  fullscreenDialog: true, // ダイアログで表示するかどうか
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
