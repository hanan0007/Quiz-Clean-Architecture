import 'package:get/get.dart';
import 'package:quiz_clean_archi/domain/core/interfaces/quiz_interface/quiz_repository.dart';
import 'package:quiz_clean_archi/domain/core/usecase/quiz_usecase/load_question_usecase.dart';
import 'package:quiz_clean_archi/infrastructure/dal/daos/quiz_daos/quiz_daos.dart';
import 'package:quiz_clean_archi/infrastructure/dal/services/api/trivia_service.dart';

import '../../../../presentation/quiz/controllers/quiz.controller.dart';

class QuizControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TriviaService());
    Get.lazyPut<QuizRepository>(() => QuizDaos(Get.find<TriviaService>()));
    Get.lazyPut(() => LoadQuestionUsecase(Get.find()));
    Get.lazyPut<QuizController>(
      () => QuizController(Get.find()),
    );
  }
}
