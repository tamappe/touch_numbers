import 'dart:async';

import 'package:flutter/material.dart';

class TimerText extends StatefulWidget {
  @override
  _TimerTextState createState() => _TimerTextState();
}

class _TimerTextState extends State<TimerText> {

    Timer _timer;

    var _now = DateTime.now();
    Duration _diff;

    @override
    void initState() {
        _timer = Timer.periodic(Duration(milliseconds: 1),
            _onTimer,
        );
        super.initState();
    }

    void _onTimer(Timer timer) {
        setState(() {
            _diff = DateTime.now().difference(_now);
        });
    }

    @override
    void dispose() {
        _timer.cancel();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        var time;
        if (_diff.inHours > 0) {
            time = '${_diff.inHours}h ${_diff.inMinutes}m ${_diff.inSeconds}s';
        } else if(_diff.inMinutes > 0) {
            time = '${_diff.inMinutes}m ${_diff.inSeconds}s';
        } else {
            time = (_diff.inMilliseconds / 1000).toStringAsFixed(2);
        }
        return Row(
          children: [
            Text(
                'Timer: $time',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        );
    }
}
