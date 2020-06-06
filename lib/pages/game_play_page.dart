import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twentyfive/models/counter_model.dart';
import 'package:twentyfive/pages/clear_page.dart';
import 'package:twentyfive/utils/constants.dart';
import 'package:twentyfive/widgets/current_number_text.dart';
import 'package:twentyfive/widgets/number_button.dart';

class GamePlayPage extends StatelessWidget {

  /// See: https://stackoverflow.com/questions/13554129/list-shuffle-in-dart
  List _shuffle(List items) {
    var random = new Random();
    for (var i = items.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);
      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }
    return items;
  }

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
    final list = List<int>.generate(25, (i) => i + 1);
    final randomList = _shuffle(list);

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
                        children: List.generate(randomList.length, (index) {
                          final isCorrect = randomList[index] == provider.currentNumber;
                          return NumberButton(
                            number: randomList[index],
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
