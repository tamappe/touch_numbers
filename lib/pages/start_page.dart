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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Numbers', style: TextStyle(
              fontSize: 30,
              color: Colors.white
            ),),
            SizedBox(
              height: 123,
            ),
            Container(
              width: 190,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Constants.borderGrayColor,
                    width: 5.0
                ),
                borderRadius: BorderRadius.circular(5),
                color: Constants.orangeColor,
              ),
              child: FlatButton(
                child: Text(
                  'Game Start',style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white
                ),
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
          ],
        ),
      ),
    );
  }
}
