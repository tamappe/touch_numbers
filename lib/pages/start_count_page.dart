import 'package:flutter/material.dart';
import 'package:twentyfive/widgets/circle_progress.dart';

class StartCountPage extends StatefulWidget {
  @override
  _StartCountPageState createState() => _StartCountPageState();
}

class _StartCountPageState extends State<StartCountPage>
    with SingleTickerProviderStateMixin {
  AnimationController progressController;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    progressController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    animation = Tween<double>(begin: 0, end: 80).animate(progressController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('text'),
      ),
      body: Center(
        child: CustomPaint(
          foregroundPainter: CircleProgress(animation.value),
          child: Container(
            width: 200,
            height: 200,
            child: GestureDetector(
              onTap: () {
                if (animation.value == 80) {
                  progressController.reverse();
                } else {
                  progressController.forward();
                }
              },
                child: Center(child: Text('${animation.value}'))),
          ),
        ),
      ),
    );
  }
}
