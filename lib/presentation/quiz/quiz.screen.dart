import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:pushable_button/pushable_button.dart';
import 'package:quiz_clean_archi/domain/const/global_const.dart';
import 'package:quiz_clean_archi/domain/const/text_const.dart';
import 'package:quiz_clean_archi/infrastructure/dal/models/question_model/question_model.dart';

import 'controllers/quiz.controller.dart';

class QuizScreen extends GetView<QuizController> {
  const QuizScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = controller.getHeight(context);

    return Scaffold(
      // bottomNavigationBar: controller.isBottomBannerAdLoaded
      //     ? SizedBox(
      //         height: controller.bottomBannerAd.size.height.toDouble(),
      //         width: controller.bottomBannerAd.size.width.toDouble(),
      //         child: AdWidget(ad: controller.bottomBannerAd),
      //       )
      //     : null,
      appBar: AppBar(
        title: Text(
          controller.name,
          style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.black
                  : Colors.white),
        ),
        centerTitle: true,
        backgroundColor: colorScheme(context).secondary,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.black
              : Colors.white,
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: height,
            width: width,
            child: Image.asset(
              controller.cat == '18'
                  ? 'assets/images/ic_tech_bg1.jpeg'
                  : controller.cat == '23'
                      ? 'assets/images/ic_history_bg.jpeg'
                      : controller.cat == '21'
                          ? 'assets/images/ic_sport_bg.jpeg'
                          : controller.cat == '25'
                              ? 'assets/images/ic_art_bg1.jpeg'
                              : 'assets/images/ic_background2.jpeg',
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: height,
            width: width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FutureBuilder<List<QuestionModel>?>(
                    future: controller.questionsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: SpinKitFadingCircle(
                            color: colorScheme(context).secondary,
                            size: 50.0,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                          child: SizedBox(),
                        );
                      } else {
                        final questions = snapshot.data!;

                        return SizedBox(
                          width: width,
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: height * 0.01),
                            child: Obx(
                              () {
                                final question =
                                    questions[controller.currentQuestionIndex];
                                return Column(
                                  children: [
                                    SizedBox(
                                      // color: Colors.red,
                                      height: 40,
                                      width: width * 0.8,
                                      child: LiquidLinearProgressIndicator(
                                        value:
                                            (controller.currentQuestionIndex +
                                                    1) /
                                                controller.totalQuestions,
                                        valueColor: AlwaysStoppedAnimation(
                                            colorScheme(context).secondary),
                                        backgroundColor: Colors.grey,
                                        borderColor: Colors.transparent,
                                        borderWidth: 5.0,
                                        borderRadius: 12.0,
                                        direction: Axis.horizontal,
                                        center: Text(
                                          '${controller.currentQuestionIndex + 1}/${controller.totalQuestions}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.transparent
                                                    .withOpacity(0.5),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Text(
                                                // parse(parse(htmlString).body!.text).documentElement!.text;
                                                controller.parseHtmlString(
                                                  question.question,
                                                ),
                                                // question.question,
                                                style: const TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 16.0),
                                          ...controller.shuffledAnswers
                                              .map((answer) => Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.transparent
                                                          .withOpacity(0.5),
                                                    ),
                                                    child: Obx(
                                                      () =>
                                                          RadioListTile<String>(
                                                        // activeColor: Colors.amber,
                                                        fillColor:
                                                            WidgetStateProperty
                                                                .resolveWith<
                                                                    Color>((Set<
                                                                        WidgetState>
                                                                    states) {
                                                          if (states.contains(
                                                              WidgetState
                                                                  .selected)) {
                                                            return colorScheme(
                                                                    context)
                                                                .secondary; // Inner color when selected
                                                          }
                                                          return Colors
                                                              .white; // Outer color when not selected
                                                        }),

                                                        title: Text(
                                                          controller
                                                              .parseHtmlString(
                                                                  answer),
                                                          // answer,
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                        value: answer,
                                                        groupValue: controller
                                                            .selectedAnswer
                                                            .value,
                                                        onChanged: (value) {
                                                          if (controller
                                                                  .selectedAnswer
                                                                  .value ==
                                                              '') {
                                                            controller.checkAnswer(
                                                                value!,
                                                                question
                                                                    .correctAnswer);
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  )),
                                          const SizedBox(height: 16.0),
                                          if (controller.selectedAnswer.value !=
                                              '')
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.transparent
                                                      .withOpacity(0.5),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Text(
                                                  controller.isAnswerCorrect!
                                                      ? 'Correct!'
                                                      : 'Incorrect! The correct answer is ${question.correctAnswer}',
                                                  style: TextStyle(
                                                      color: controller
                                                              .isAnswerCorrect!
                                                          ? Colors.green
                                                          : Colors.red,
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          const SizedBox(height: 16.0),
                                          SizedBox(
                                            width: 10,
                                            child: Center(
                                              child: PushableButton(
                                                height: 50,
                                                elevation: 4,
                                                hslColor: HSLColor.fromColor(
                                                    colorScheme(context)
                                                        .secondary),
                                                shadow: BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: const Offset(0, 2),
                                                ),
                                                child: Text('Next Question',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Theme.of(context)
                                                                    .brightness ==
                                                                Brightness.light
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                onPressed: () {
                                                  if (controller.selectedAnswer
                                                          .value !=
                                                      '') {
                                                    controller.nextQuestion();
                                                  } else {
                                                    Get.snackbar('Answer',
                                                        'Please select answer',
                                                        snackPosition:
                                                            SnackPosition.TOP,
                                                        colorText:
                                                            Colors.white);
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
