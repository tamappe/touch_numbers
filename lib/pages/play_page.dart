import 'package:flutter/material.dart';

class PlayPage extends StatefulWidget {
  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(color: Colors.black),
        child: Center(
          child: FlatButton(
            child: Text(
              'Play',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute<Null>(
                  settings: const RouteSettings(name: "/play"),
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
