import 'package:get/get.dart';
import 'package:quiz_clean_archi/domain/core/interfaces/splash_interface/splash_repository.dart';
import 'package:quiz_clean_archi/domain/core/usecase/splash_usecase/firebasemsg_usecase.dart';
import 'package:quiz_clean_archi/domain/core/usecase/splash_usecase/gettoken_usecase.dart';
import 'package:quiz_clean_archi/infrastructure/dal/daos/splash_daos/firebasemsg_daos.dart';
import 'package:quiz_clean_archi/infrastructure/dal/services/notifactions/firebase_messing.dart';

import '../../../../presentation/splash/controllers/splash.controller.dart';

class SplashControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FirebaseMessing());
    Get.lazyPut<SplashRepository>(() => SplashDao(Get.find<FirebaseMessing>()));
    Get.lazyPut(() => FireBaseMsgUsecase(Get.find()));
    Get.lazyPut(() => GettokenUsecase(Get.find()));
    Get.lazyPut<SplashController>(
      () => SplashController(Get.find(), Get.find()),
    );
  }
}
