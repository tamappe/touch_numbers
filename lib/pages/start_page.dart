import 'package:flutter/material.dart';
import 'package:twentyfive/pages/start_count_page.dart';
import 'package:twentyfive/utils/constants.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text(
            'Start',
          ),
          onPressed: () {
            Navigator.push(
              context,
              new MaterialPageRoute<Null>(
                settings: const RouteSettings(name: Constants.startCountRoute),
                builder: (BuildContext context) => StartCountPage(),
                fullscreenDialog: true, // ダイアログで表示するかどうか
              ),
            );
          },
        ),
      ),
    );
  }
}
