import 'package:flutter/material.dart';
import 'package:twentyfive/pages/count_down_page.dart';
import 'package:twentyfive/pages/start_page.dart';
import 'package:twentyfive/utils/constants.dart';
import 'package:twentyfive/widgets/finish_text.dart';

class ClearPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Theme.of(context).accentColor,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      Text(
                          'クリアタイム',
                          style: TextStyle(
                          color: Theme.of(context).primaryColor
                      ),
                      ),
                    FinishText(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          Container(
                              width: 120,
                              height: 50,
                              child: FlatButton(
                                  textColor: Theme.of(context).accentColor,
                                  color: Constants.orangeColor,
                                  onPressed: () {
                                      Navigator.push(
                                          context,
                                          new MaterialPageRoute<Null>(
                                              settings: RouteSettings(name: Constants.startCountRoute),
                                              builder: (BuildContext context) => CountDownPage(),
                                          ),
                                      );
                                  },
                                  child: Text('RETRY', style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                  ),)
                              ),
                          ),
                          Container(
                              width: 120,
                              height: 50,
                            child: FlatButton(
                                textColor: Colors.white,
                                color: Constants.orangeColor,
                                onPressed: () {
                                    Navigator.push(
                                        context,
                                        new MaterialPageRoute<Null>(
                                            settings: RouteSettings(name: Constants.startRoute),
                                            builder: (BuildContext context) => StartPage(),
                                        ),
                                    );
                                },
                                child: Text('TOP', style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                ),)
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
            ),
        ),
    );
  }
}
