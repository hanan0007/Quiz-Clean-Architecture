import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:quiz_clean_archi/domain/core/interfaces/dashbard_interface/dashboard_repository.dart';
import 'package:quiz_clean_archi/domain/core/usecase/dashboard_usecase/check_appversion.dart';
import 'package:quiz_clean_archi/domain/core/usecase/dashboard_usecase/launch_email.dart';
import 'package:quiz_clean_archi/domain/core/usecase/dashboard_usecase/userscore.dart';
import 'package:quiz_clean_archi/domain/core/usecase/splash_usecase/read_user_usecase.dart';
import 'package:quiz_clean_archi/infrastructure/dal/daos/dashboard_daos/dashboard_daos.dart';
import 'package:quiz_clean_archi/infrastructure/dal/services/db/database_service.dart';

import '../../../../presentation/dashboard/controllers/dashboard.controller.dart';

class DashboardControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FirebaseService());
    Get.lazyPut<DashboardRepository>(
        () => DashboardDaos(Get.find<FirebaseService>()));
    Get.lazyPut(() => LaunchEmailUseCase(Get.find()));
    Get.lazyPut(() => ReadUserUsecase(Get.find()));
    Get.lazyPut(() => CheckAppversionUseCase(Get.find()));
    Get.lazyPut(() => UserscoreUsecase(Get.find()));
    Get.lazyPut<DashboardController>(
      () => DashboardController(Get.find(), Get.find(), Get.find(), Get.find()),
    );
  }
}
