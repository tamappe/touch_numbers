import 'package:flutter/material.dart';
import 'dart:math';

class CircleProgress extends CustomPainter {

  double currentProgress;
  CircleProgress(this.currentProgress);

  @override
  void paint(Canvas canvas, Size size) {
    Paint outerCircle = Paint()
        ..strokeWidth = 7
      ..color = Colors.black
        ..style = PaintingStyle.stroke;
    Paint completeArc = Paint()
    ..strokeWidth = 7
      ..color = Colors.redAccent
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width /2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2) - 7;

    canvas.drawCircle(center, radius, outerCircle);

    double angle = 2 * pi * (currentProgress / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi/ 2, angle, false, completeArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
