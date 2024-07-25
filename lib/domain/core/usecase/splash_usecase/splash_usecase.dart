import 'package:quiz_clean_archi/domain/core/interfaces/splash_interface/splash_repository.dart';

class SplashUsecase {
  final SplashRepository splashRepository;

  SplashUsecase(this.splashRepository);
  execute() {
    return splashRepository.initilizefirebasemessage();
  }
}
