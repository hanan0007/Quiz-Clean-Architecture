import 'package:get/get.dart';
import 'package:quiz_clean_archi/domain/core/interfaces/leaderboard_interface/leaderboard_repository.dart';
import 'package:quiz_clean_archi/domain/core/usecase/leaderboard_usecase/topuser_usecase.dart';
import 'package:quiz_clean_archi/infrastructure/dal/daos/leaderboard_daos/leaderboard_daos.dart';
import 'package:quiz_clean_archi/infrastructure/dal/services/db/database_service.dart';

import '../../../../presentation/leaderboard/controllers/leaderboard.controller.dart';

class LeaderboardControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FirebaseService());
    Get.lazyPut<LeaderboardRepository>(
        () => LeaderboardDaos(Get.find<FirebaseService>()));
    Get.lazyPut(() => TopuserUsecase(Get.find()));
    Get.lazyPut<LeaderboardController>(
      () => LeaderboardController(Get.find()),
    );
  }
}
