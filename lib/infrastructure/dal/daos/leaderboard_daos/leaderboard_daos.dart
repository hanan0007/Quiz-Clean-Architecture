import 'package:quiz_clean_archi/domain/core/interfaces/leaderboard_interface/leaderboard_repository.dart';
import 'package:quiz_clean_archi/infrastructure/dal/services/db/database_service.dart';

class LeaderboardDaos implements LeaderboardRepository {
  final FirebaseService firebaseService;
  LeaderboardDaos(this.firebaseService);
  @override
  Future<List<Map<String, dynamic>>> champions() {
    return firebaseService.getTopUsers();
  }
}
