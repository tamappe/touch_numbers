import 'package:flutter/material.dart';
import 'dart:math';

class CircleProgress extends CustomPainter {

  double currentProgress;
  CircleProgress(this.currentProgress);

  @override
  void paint(Canvas canvas, Size size) {
    Paint outerCircle = Paint()
        ..strokeWidth = 5
        ..style = PaintingStyle.stroke;
    Paint completeArc = Paint()
        ..strokeWidth = 5
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width /2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2) - 7;

    if (currentProgress >= 200) {
        outerCircle.color = Colors.yellowAccent;
    } else if (currentProgress >= 100) {
        outerCircle.color = Colors.white;
    }

    canvas.drawCircle(center, radius, outerCircle);
    if (currentProgress >= 200) {
        currentProgress = currentProgress - 200;
        completeArc.color = Colors.greenAccent;
    } else if (currentProgress >= 100) {
        currentProgress = currentProgress - 100;
        completeArc.color = Colors.yellowAccent;
    }
    double angle = 2 * pi * (currentProgress / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi/ 2, angle, false, completeArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
