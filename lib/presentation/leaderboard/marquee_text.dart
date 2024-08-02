import 'dart:async';
import 'package:flutter/material.dart';

class MarqueeText extends StatefulWidget {
  final String text;
  final double scrollSpeed;
  final Duration pauseDuration; // Add pause duration parameter
  const MarqueeText({
    super.key,
    required this.text,
    required this.scrollSpeed,
    this.pauseDuration = const Duration(seconds: 1), // Default pause duration
  });

  @override
  State<MarqueeText> createState() => _MarqueeTextState();
}

class _MarqueeTextState extends State<MarqueeText>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late ScrollController scrollController;
  late Timer pauseTimer;
  bool isPaused = false;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: adjustedSpeed().toInt()),
    )..addListener(() {
        if (isPaused) return;

        double newOffset = animationController.value *
            scrollController.position.maxScrollExtent;

        if (newOffset >= scrollController.position.maxScrollExtent - 1) {
          // Close to the end
          if (widget.pauseDuration > Duration.zero) {
            pauseScrolling();
          } else {
            // Loop indefinitely without pause
            scrollController.jumpTo(0);
            animationController.repeat();
          }
        } else {
          scrollController.jumpTo(newOffset);
        }
      });

    animationController.repeat();
  }

  double adjustedSpeed() {
    // If speed is 1, return 2, otherwise return the speed as is
    return widget.scrollSpeed == 1 ? 2 : widget.scrollSpeed;
  }

  void pauseScrolling() {
    setState(() {
      isPaused = true;
    });

    pauseTimer = Timer(widget.pauseDuration, () {
      setState(() {
        isPaused = false;
        scrollController.jumpTo(0);
        animationController.repeat();
      });
    });
  }

  @override
  void didUpdateWidget(covariant MarqueeText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.scrollSpeed != widget.scrollSpeed ||
        oldWidget.pauseDuration != widget.pauseDuration) {
      animationController.duration = Duration(seconds: adjustedSpeed().toInt());
      animationController.repeat();
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    scrollController.dispose();
    pauseTimer.cancel(); // Cancel the timer if it's still running
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: ListView(
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(), // Disable manual scrolling
          children: <Widget>[
            Center(
              child: Text(
                widget.text,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
