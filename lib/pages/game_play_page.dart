import 'package:flutter/material.dart';
import 'package:twentyfive/utils/constants.dart';

class GamePlayPage extends StatefulWidget {
  @override
  _GamePlayPageState createState() => _GamePlayPageState();
}

class _GamePlayPageState extends State<GamePlayPage> {
  void _tappedNumberButton() {}

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
                children: <Widget>[Text('a'), Text('b')],
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
                      return NumberButton(index + 1, _tappedNumberButton);
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
