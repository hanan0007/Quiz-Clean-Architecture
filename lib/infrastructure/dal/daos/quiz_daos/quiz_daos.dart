import 'package:quiz_clean_archi/domain/core/interfaces/quiz_interface/quiz_repository.dart';
import 'package:quiz_clean_archi/infrastructure/dal/models/question_model/question_model.dart';
import 'package:quiz_clean_archi/infrastructure/dal/services/api/trivia_service.dart';

class QuizDaos implements QuizRepository {
  final TriviaService triviaService;
  QuizDaos(this.triviaService);
  @override
  Future<List<QuestionModel>?> loadquestion(
      int amount, String category, String difficulty) async {
    return await triviaService.fetchQuestions(amount, category, difficulty);
  }
}
