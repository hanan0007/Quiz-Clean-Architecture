import 'package:quiz_clean_archi/domain/core/interfaces/splash_interface/splash_repository.dart';

class FireBaseMsgUsecase {
  final SplashRepository splashRepository;

  FireBaseMsgUsecase(this.splashRepository);
  Future<void> execute() async {
    return splashRepository.initilizefirebasemessage();
  }
}
