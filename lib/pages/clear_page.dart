import 'package:flutter/material.dart';
import 'package:twentyfive/pages/start_page.dart';
import 'package:twentyfive/utils/constants.dart';

class ClearPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: FlatButton(
                onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute<Null>(
                            settings: RouteSettings(name: Constants.startRoute),
                            builder: (BuildContext context) => StartPage(),
                        ),
                    );
                },
                child: Text('clear')
            ),
        ),
    );
  }
}
