import 'package:quiz_clean_archi/domain/core/interfaces/quiz_interface/quiz_repository.dart';

class UpdateuserStatsUsecase {
  final QuizRepository quizRepository;
  UpdateuserStatsUsecase(this.quizRepository);
  Future<void> execute(String id, int correct, int total) async {
    return await quizRepository.updateUserStats(id, correct, total);
  }
}
