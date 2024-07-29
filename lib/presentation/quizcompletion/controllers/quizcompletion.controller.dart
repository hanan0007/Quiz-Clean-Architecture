import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizcompletionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late AudioPlayer audioPlayer;
  getwidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }

  int correct = Get.arguments['correct'];

  @override
  void onInit() {
    super.onInit();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    controller.forward();
    audioPlayer = AudioPlayer();
    _playCongratulatorySound();
  }

  void _playCongratulatorySound() async {
    await audioPlayer.play(AssetSource('sounds/ic_cong.mp3'));
  }
}
