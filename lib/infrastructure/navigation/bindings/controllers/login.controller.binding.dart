import 'package:get/get.dart';
import 'package:quiz_clean_archi/domain/core/interfaces/login_interface/login_repository.dart';
import 'package:quiz_clean_archi/domain/core/usecase/login_usecase/write_usercredentioal_usecase.dart';
import 'package:quiz_clean_archi/infrastructure/dal/daos/login_daos/login_daos.dart';

import '../../../../presentation/login/controllers/login.controller.dart';

class LoginControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginRepository>(() => LoginDaos());
    Get.lazyPut(() => WriteUsercredentioalUsecase(Get.find()));
    Get.lazyPut<LoginController>(
      () => LoginController(Get.find()),
    );
  }
}
