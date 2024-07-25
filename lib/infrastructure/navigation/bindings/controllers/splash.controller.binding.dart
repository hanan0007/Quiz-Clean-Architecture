import 'package:get/get.dart';
import 'package:quiz_clean_archi/domain/core/interfaces/splash_interface/splash_repository.dart';
import 'package:quiz_clean_archi/domain/core/usecase/splash_usecase/splash_usecase.dart';
import 'package:quiz_clean_archi/infrastructure/dal/daos/splash_daos/splash_daos.dart';

import '../../../../presentation/splash/controllers/splash.controller.dart';

class SplashControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashRepository>(() => SplashDaos());
    Get.lazyPut(() => SplashUsecase(Get.find()));
    Get.lazyPut<SplashController>(
      () => SplashController(Get.find()),
    );
  }
}
