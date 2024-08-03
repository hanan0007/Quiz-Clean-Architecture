// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quiz_clean_archi/presentation/dashboard/score_circle/empty_circle.dart';

import '../controllers/dashboard.controller.dart';
import 'circle_painter.dart';

class CircleView extends StatefulWidget {
  final int totalValue;
  final int wrongValue;
  // final DashboardController controller;
  final int righValue;
  // final double height;
  // final double width;
  final double radius;
  const CircleView({
    super.key,
    required this.radius,
    required this.totalValue,
    required this.wrongValue,
    required this.righValue,
  });

  @override
  State<CircleView> createState() => _CircleViewState();
}

class _CircleViewState extends State<CircleView> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: widget.radius + 20, // Adjusted height
                        width: widget.radius + 20, // Adjusted width
                        child: CustomPaint(
                          painter: MyPainterEmptyCircle(),
                        ),
                      ),
                      Center(
                        child: TweenAnimationBuilder(
                          duration: const Duration(seconds: 4),
                          tween: Tween(begin: 0.0, end: 1.0),
                          curve: Curves.easeOutCubic,
                          builder: (context, value, child) {
                            return InkWell(
                              onTap: () {},
                              child: SizedBox(
                                height: widget.radius,
                                width: widget.radius,
                                child: CustomPaint(
                                  painter: OpenPainter(
                                    // totalQuestions: widget.totalquestion,
                                    rightAnswers: widget.righValue,
                                    wrongAnswers: widget.wrongValue,
                                    range:
                                        value, // Ensure the full circle is drawn
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
