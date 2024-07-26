import 'package:quiz_clean_archi/domain/core/interfaces/splash_interface/splash_repository.dart';

class GettokenUsecase {
  final SplashRepository splashRepository;
  GettokenUsecase(this.splashRepository);
  Future<void> execute() async {
    return splashRepository.gettoken();
  }
}
