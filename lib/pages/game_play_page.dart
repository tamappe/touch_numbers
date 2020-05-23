import 'package:flutter/material.dart';
import 'package:twentyfive/pages/clear_page.dart';
import 'package:twentyfive/utils/constants.dart';
import 'package:flip_card/flip_card.dart';

class GamePlayPage extends StatefulWidget {
  @override
  _GamePlayPageState createState() => _GamePlayPageState();
}

class _GamePlayPageState extends State<GamePlayPage> {
  int _currentNumber = 1;

  void _updateCurrentNumber() {
    if (_currentNumber >= 25) {
      Navigator.push(
        context,
        new MaterialPageRoute<Null>(
          settings: RouteSettings(name: Constants.clearRoute),
          builder: (BuildContext context) => ClearPage(),
        ),
      );
    }
    setState(() {
      _currentNumber += 1;
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
                              '$_currentNumber',
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
                      final isCorrect = index + 1 == _currentNumber;
                      return NumberButton(index + 1, () {
                        if (isCorrect) {
                          _updateCurrentNumber();
                        }
                      }, isCorrect);
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
  final int _number;
  final Function _onPressed;
  final bool _isOnTouch;

  NumberButton(this._number, this._onPressed, this._isOnTouch);

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      speed: 500,
      // タップイベント
      onFlip: _onPressed,
      flipOnTouch: _isOnTouch,
      front: _frontNumberButton(),
      back: _backNumberButton(),
    );
  }

  Widget _frontNumberButton() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2.0),
        borderRadius: BorderRadius.circular(10),
        color: Constants.orangeColor,
      ),
      child: Center(
        child: Text(
          '$_number',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _backNumberButton() {
    return Stack(
      children: <Widget>[
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.circular(10),
            color: Constants.orangeColor,
          ),
          child: Center(
            child: Text(
              '$_number',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Opacity(
            opacity: .8,
            child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                )))
      ],
    );
  }
}
