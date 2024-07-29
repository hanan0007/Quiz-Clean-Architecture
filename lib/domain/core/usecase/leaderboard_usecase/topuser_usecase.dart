import 'package:quiz_clean_archi/domain/core/interfaces/leaderboard_interface/leaderboard_repository.dart';

class TopuserUsecase {
  final LeaderboardRepository leaderboardRepository;
  TopuserUsecase(this.leaderboardRepository);
  Future<List<Map<String, dynamic>>> execute() {
    return leaderboardRepository.champions();
  }
}
