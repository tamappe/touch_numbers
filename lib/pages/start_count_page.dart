import 'package:flutter/material.dart';
import 'package:twentyfive/pages/play_page.dart';
import 'package:twentyfive/utils/constants.dart';
import 'package:twentyfive/widgets/circle_progress.dart';

class StartCountPage extends StatefulWidget {
  @override
  _StartCountPageState createState() => _StartCountPageState();
}

class _StartCountPageState extends State<StartCountPage> with SingleTickerProviderStateMixin {
  AnimationController progressController;
  Animation animation;

  double millSeconds = 3;

  @override
  void initState() {
    super.initState();
    progressController = AnimationController(vsync: this, duration: Duration(milliseconds: 3000));
    animation = Tween<double>(begin: 0, end: 300).animate(progressController)
      ..addListener(() {
        setState(() {
            double localSecond = 300 - animation.value;
            millSeconds = 1 + localSecond / 100;
        });
      })
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed)
        Navigator.push(
          context,
          new MaterialPageRoute<Null>(
            settings: const RouteSettings(name: Constants.playRoute),
            builder: (BuildContext context) => PlayPage(),
          ),
        );
    });
    progressController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          foregroundPainter: CircleProgress(animation.value),
          child: Container(
            width: 200,
            height: 200,
            child: Center(child: Text('${millSeconds.toInt()}')),
          ),
        ),
      ),
    );
  }
}
