import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('サンプル'),
        ),
        body: Center(
          child: FlatButton(
            child: Text('Start'),
            onPressed: () {
              Navigator.of(context).pushNamed('/play');
            },
          ),
        ),
    );
  }
}
