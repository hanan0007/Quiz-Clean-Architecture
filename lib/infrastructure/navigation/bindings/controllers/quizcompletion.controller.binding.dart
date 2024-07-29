import 'package:get/get.dart';

import '../../../../presentation/quizcompletion/controllers/quizcompletion.controller.dart';

class QuizcompletionControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizcompletionController>(
      () => QuizcompletionController(),
    );
  }
}
