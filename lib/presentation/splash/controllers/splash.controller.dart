import 'package:get/get.dart';
import 'package:quiz_clean_archi/domain/core/usecase/splash_usecase/splash_usecase.dart';

class SplashController extends GetxController {
  final SplashUsecase splashUsecase;

  SplashController(this.splashUsecase);
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    splashUsecase.execute();
  }
}
