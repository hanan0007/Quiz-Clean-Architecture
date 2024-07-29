import 'package:quiz_clean_archi/infrastructure/dal/models/question_model/question_model.dart';

abstract class QuizRepository {
  Future<List<QuestionModel>?> loadquestion(
      int amount, String category, String difficulty);
}
