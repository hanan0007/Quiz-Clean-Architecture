// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quiz_clean_archi/presentation/dashboard/score_circle/empty_circle.dart';
import 'circle_painter.dart';

class CircleScoreIndicator extends StatefulWidget {
  final int totalValue;
  final int wrongValue;
  final int righValue;
  final Color? avatarForegroundColor;
  final Color? avatarBackgroundColor;
  final String? score;
  final String? title;
  final String? subTitle;
  final TextStyle? titleTextStyle;
  final TextStyle? scoreTextStyle;
  final TextStyle? subTitleTextstyle;
  final double radius;
  const CircleScoreIndicator({
    super.key,
    required this.radius,
    required this.totalValue,
    required this.wrongValue,
    required this.righValue,
    this.avatarForegroundColor,
    this.avatarBackgroundColor,
    this.score,
    this.title,
    this.subTitle,
    this.titleTextStyle,
    this.scoreTextStyle,
    this.subTitleTextstyle,
  });

  @override
  State<CircleScoreIndicator> createState() => _CircleScoreIndicatorState();
}

class _CircleScoreIndicatorState extends State<CircleScoreIndicator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    CircleAvatar(
                      foregroundColor:
                          widget.avatarForegroundColor ?? Colors.black,
                      backgroundColor: Colors.black,
                      radius: widget.radius / 2 - 15,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: widget.radius * 0.05),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              widget.title ?? "Score",
                              style: widget.titleTextStyle ??
                                  const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.score ?? "31",
                              style: widget.scoreTextStyle ??
                                  TextStyle(
                                      color: Colors.amber,
                                      fontSize: widget.radius * 0.15,
                                      fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.subTitle ?? "pt",
                              style: widget.subTitleTextstyle ??
                                  TextStyle(
                                      color: Colors.white,
                                      fontSize: widget.radius * 0.1,
                                      fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: widget.radius + 20, // Adjusted height
                      width: widget.radius + 20, // Adjusted width
                      child: CustomPaint(
                        painter: MyPainterEmptyCircle(),
                      ),
                    ),
                    TweenAnimationBuilder(
                      duration: const Duration(seconds: 4),
                      tween: Tween(begin: 0.0, end: 1.0),
                      curve: Curves.easeOutCubic,
                      builder: (context, value, child) {
                        return SizedBox(
                          height: widget.radius,
                          width: widget.radius,
                          child: CustomPaint(
                            painter: OpenPainter(
                              // totalQuestions: widget.totalquestion,
                              rightAnswers: widget.righValue,
                              wrongAnswers: widget.wrongValue,
                              range: value, // Ensure the full circle is drawn
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
