import 'package:flutter/material.dart';
import 'dart:math' as math;

class OpenPainter extends CustomPainter {
  final int rightAnswers;
  final int wrongAnswers;
  final double range;
  final double strokeWidth; // Customizable strokeWidth

  OpenPainter({
    required this.rightAnswers,
    required this.wrongAnswers,
    required this.range,
    this.strokeWidth = 7.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double pi = math.pi;

    // Calculate the smallest dimension to make the circle fit within the given size
    double diameter = math.min(size.width, size.height);

    // Define the rectangle for the arc based on the calculated diameter
    Rect rect =
        Offset((size.width - diameter) / 2, (size.height - diameter) / 2) &
            Size(diameter, diameter);

    // Paint for right answers (green)
    var paintRight = Paint()
      ..color = Colors.green
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    // Paint for wrong answers (red)
    var paintWrong = Paint()
      ..color = Colors.red
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    // Calculate total answers and angles
    int totalAnswers = rightAnswers + wrongAnswers;
    if (totalAnswers > 0) {
      double rightAngle = (rightAnswers / totalAnswers) * 2 * pi * range;
      double wrongAngle = (wrongAnswers / totalAnswers) * 2 * pi * range;

      // Start drawing arcs
      double startAngle = 0;
      canvas.drawArc(rect, startAngle, rightAngle, false, paintRight);
      startAngle += rightAngle;
      canvas.drawArc(rect, startAngle, wrongAngle, false, paintWrong);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
