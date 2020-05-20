import 'package:flutter/material.dart';
import 'package:twentyfive/pages/clear_page.dart';
import 'package:twentyfive/utils/constants.dart';

class GamePlayPage extends StatefulWidget {
  @override
  _GamePlayPageState createState() => _GamePlayPageState();
}

class _GamePlayPageState extends State<GamePlayPage> {
  int currentNumber = 1;

  void _onPressedNumberButton() {}

  void _updateCurrentNumber() {
    if (currentNumber >= 25) {
      Navigator.push(
        context,
        new MaterialPageRoute<Null>(
          settings: RouteSettings(name: Constants.clearRoute),
          builder: (BuildContext context) => ClearPage(),
        ),
      );
    }
    setState(() {
      currentNumber += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                          width: 140.0,
                          height: 50.0,
                          color: Colors.white,
                          child: Center(
                            child: Text(
                              '$currentNumber',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.black, fontSize: 30),
                            ),
                          )),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 20),
                    child: Center(
                        child: Text(
                      'Timer: 3.57',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                  )
                ],
              ),
              SizedBox(
                height: 48.0,
              ),
              SizedBox(
                height: 400.0,
                child: GridView.count(
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 5,
                    children: List.generate(25, (index) {
                      return NumberButton(index + 1, () {
                        if (index + 1 == currentNumber) {
                          _updateCurrentNumber();
                        }
                      });
                    })),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NumberButton extends StatelessWidget {
  final int number;
  final Function onPressed;

  NumberButton(this.number, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2.0),
        borderRadius: BorderRadius.circular(10),
        color: Constants.orangeColor,
      ),
      child: FlatButton(
          child: Text(
            '$number',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: onPressed),
    );
  }
}
