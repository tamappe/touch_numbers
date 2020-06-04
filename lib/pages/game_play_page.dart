import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twentyfive/models/counter_model.dart';
import 'package:twentyfive/pages/clear_page.dart';
import 'package:twentyfive/utils/constants.dart';
import 'package:flip_card/flip_card.dart';

class CurrentNumberText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
          width: 140.0,
          height: 50.0,
          color: Colors.white,
          child: Center(
            child: Text(
              /// Provider で model から直接、値を受け取れる
              '${Provider.of<CounterModel>(context).currentNumber}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black, fontSize: 30),
            ),
          )
      ),
    );
  }
}

class GamePlayPage extends StatelessWidget {

  void _updateCurrentNumber(BuildContext context, CounterModel provider) {
    if (provider.currentNumber >= 25) {
      Navigator.push(
        context,
        new MaterialPageRoute<Null>(
          settings: RouteSettings(name: Constants.clearRoute),
          builder: (BuildContext context) => ClearPage(),
        ),
      );
    }
    provider.updateCurrentNumber();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterModel>(
      create: (context) => CounterModel(),
      child: Consumer<CounterModel>(
        builder: (context, provider, child) => Scaffold(
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
                        child: CurrentNumberText(),
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
                          final isCorrect = index + 1 == provider.currentNumber;
                          return NumberButton(
                            number: index + 1,
                            onPressed: () => _updateCurrentNumber(context, provider),
                            isOnTouch: isCorrect,
                          );
                        })),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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
