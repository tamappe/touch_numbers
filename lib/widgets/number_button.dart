import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:twentyfive/utils/constants.dart';

class NumberButton extends StatelessWidget {
    final int number;
    final Function onPressed;
    final bool isOnTouch;

    NumberButton({@required this.number, @required this.onPressed, @required this.isOnTouch});

    @override
    Widget build(BuildContext context) {
        return FlipCard(
            direction: FlipDirection.HORIZONTAL,
            speed: 500,
            // タップイベント
            onFlip: onPressed,
            flipOnTouch: isOnTouch,
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
                    '$number',
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
                            '$number',
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
