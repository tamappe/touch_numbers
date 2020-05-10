import 'package:flutter/material.dart';
import 'package:twentyfive/pages/start_page.dart';
import 'package:twentyfive/utils/constants.dart';

class PlayPage extends StatefulWidget {
  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text(
            'Play',
          ),
          onPressed: () {
            Navigator.push(
              context,
              new MaterialPageRoute<Null>(
                settings: const RouteSettings(name: Constants.startRoute),
                builder: (BuildContext context) => StartPage(),
                fullscreenDialog: true, // ダイアログで表示するかどうか
              ),
            );
          },
        ),
      ),
    );
  }
}
