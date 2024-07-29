import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pushable_button/pushable_button.dart';
import 'package:quiz_clean_archi/domain/const/global_const.dart';
import 'package:quiz_clean_archi/infrastructure/navigation/routes.dart';

import 'controllers/quizcompletion.controller.dart';

class QuizcompletionScreen extends GetView<QuizcompletionController> {
  const QuizcompletionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = controller.getwidth(context);
    return PopScope(
      onPopInvoked: (didPop) {
        // controller.showInterstitialAd(() {
        Get.offNamed(Routes.DASHBOARD);
        // });
      },
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colorScheme(context).secondary,
          title: const Text('Quiz Completed'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AnimatedBuilder(
                animation: controller.animation,
                builder: (context, child) {
                  return SizedBox(
                    height: height * 0.3 * controller.animation.value,
                    width: width * 0.5 * controller.animation.value,
                    child: Image.asset('assets/images/ic_cong.png'),
                  );
                },
              ),
              const Text(
                'Quiz Completed!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                'You answered ${controller.correct} questions correctly.',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: width * 0.4,
                child: PushableButton(
                  height: 50,
                  elevation: 4,
                  hslColor: HSLColor.fromColor(colorScheme(context).secondary),
                  shadow: BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 2),
                  ),
                  child: const Text('Play again',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    // controller.showInterstitialAd(() {
                    Get.offNamed(Routes.HOME);
                    // });
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: width * 0.5,
                child: PushableButton(
                  height: 50,
                  elevation: 4,
                  hslColor: HSLColor.fromColor(colorScheme(context).secondary),
                  shadow: BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 2),
                  ),
                  child: const Text('Go to Dashboard',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    // controller.showInterstitialAd(
                    // () {
                    Get.offNamed(Routes.DASHBOARD);
                    //   },
                    // );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
