import 'package:flutter/material.dart';
import 'dart:math' as math;

class OpenPainter extends CustomPainter {
  final int rightAnswers;
  final int wrongAnswers;
  final double range;
  double pi = math.pi;

  OpenPainter({
    required this.rightAnswers,
    required this.wrongAnswers,
    required this.range,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 7;
    Rect myRect = Offset(size.width / 2 - 80, size.height / 2 - 80) &
        const Size(160.0, 160.0); // Adjusted size and position

    var paintRight = Paint()
      ..color = Colors.green
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    var paintWrong = Paint()
      ..color = Colors.red
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    int totalAnswers = rightAnswers + wrongAnswers;
    double rightAngle = (rightAnswers / totalAnswers) * 2 * pi * range;
    double wrongAngle = (wrongAnswers / totalAnswers) * 2 * pi * range;

    double startAngle = 0;

    canvas.drawArc(myRect, startAngle, rightAngle, false, paintRight);
    startAngle += rightAngle;
    canvas.drawArc(myRect, startAngle, wrongAngle, false, paintWrong);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
