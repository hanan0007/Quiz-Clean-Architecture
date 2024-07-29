import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:quiz_clean_archi/domain/core/usecase/quiz_usecase/load_question_usecase.dart';
import 'package:quiz_clean_archi/infrastructure/dal/models/question_model/question_model.dart';
import 'package:html/parser.dart';

class QuizController extends GetxController {
  final LoadQuestionUsecase loadQuestionUsecase;
  QuizController(this.loadQuestionUsecase);

  String cat = Get.arguments['cat'];
  String name = Get.arguments['name'];
  late Future<List<QuestionModel>?> questionsFuture;
  List<QuestionModel> questions = [];
  int currentQuestionIndex = 0;
  RxString selectedAnswer = ''.obs;
  bool? isAnswerCorrect;
  final count = 0.obs;
  int correctAnswersCount = 0;
  String category = "9";
  int totalQuestions = 10; // Total number of questions
  List<String> shuffledAnswers =
      []; // List to hold shuffled answers for current question

  getHeight(BuildContext context) {
    return MediaQuery.sizeOf(context).height;
  }

  loadquestion() async {
    questionsFuture =
        loadQuestionUsecase.execute(totalQuestions, cat, 'medium');
    print("object${questionsFuture}");
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    questions = (await questionsFuture)!;
    if (questions.isNotEmpty) {
      shuffleAnswers(questions[currentQuestionIndex]);
    }
    update();
  }

  void shuffleAnswers(QuestionModel question) {
    shuffledAnswers = [...question.incorrectAnswers, question.correctAnswer]
      ..shuffle();
  }

  String parseHtmlString(String htmlString) {
    var document = parse(htmlString);
    return parse(document.body!.text).documentElement!.text;
  }

  Future<void> nextQuestion() async {
    if (currentQuestionIndex < totalQuestions - 1) {
      currentQuestionIndex++;
      selectedAnswer.value = '';
      isAnswerCorrect = null;
      shuffleAnswers(questions[currentQuestionIndex]);
      update();
    } else {
      print('total right answer is ${correctAnswersCount}');
      // Handle quiz completion
      // _updateUserStatsInFirebase();

      // Get.offAll(() => QuizcompleteView(
      //       number: correctAnswersCount,
      //     ));
    }
  }

  void checkAnswer(String answer, String correctAnswer) {
    selectedAnswer.value = answer;
    isAnswerCorrect = answer == correctAnswer;
    if (isAnswerCorrect!) {
      correctAnswersCount++;
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadquestion();
  }
}
