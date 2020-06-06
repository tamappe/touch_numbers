import 'package:flutter/material.dart';
import 'package:twentyfive/models/counter_model.dart';
import 'package:provider/provider.dart';

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