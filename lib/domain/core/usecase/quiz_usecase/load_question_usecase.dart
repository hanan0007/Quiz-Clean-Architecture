import 'package:quiz_clean_archi/domain/core/interfaces/quiz_interface/quiz_repository.dart';
import 'package:quiz_clean_archi/infrastructure/dal/models/question_model/question_model.dart';

class LoadQuestionUsecase {
  final QuizRepository quizRepository;
  LoadQuestionUsecase(this.quizRepository);
  Future<List<QuestionModel>?> execute(
      int amount, String category, String difficulty) {
    return quizRepository.loadquestion(amount, category, difficulty);
  }
}
