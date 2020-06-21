import 'package:flutter/material.dart';
import 'package:twentyfive/pages/game_play_page.dart';
import 'package:twentyfive/utils/constants.dart';
import 'package:twentyfive/widgets/circle_progress.dart';

class CountDownPage extends StatefulWidget {
  @override
  _CountDownPageState createState() => _CountDownPageState();
}

class _CountDownPageState extends State<CountDownPage> with SingleTickerProviderStateMixin {
  AnimationController _progressController;
  Animation _animation;

  double _millSeconds = 3;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation = Tween<double>(begin: 0, end: 300).animate(_progressController);
    _animation.addListener(() {
      setState(() {
        double localSecond = 300 - _animation.value;
        _millSeconds = 1 + localSecond / 100;
      });
    });
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed)
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => GamePlayPage(),
          ),
        );
    });
    _progressController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          foregroundPainter: CircleProgress(_animation.value),
          child: Container(
            width: Constants.circleSize,
            height: Constants.circleSize,
            child: Center(
                child: Text(
              '${_millSeconds.toInt()}',
              style: TextStyle(fontSize: Constants.circleFontSize, fontWeight: FontWeight.bold),
            )),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _progressController.dispose();
  }
}
