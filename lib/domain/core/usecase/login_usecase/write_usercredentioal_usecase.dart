import 'package:quiz_clean_archi/domain/core/interfaces/login_interface/login_repository.dart';

class WriteUsercredentioalUsecase {
  final LoginRepository loginRepository;
  WriteUsercredentioalUsecase(this.loginRepository);
  execute(String name, String age, String gender) {
    return loginRepository.writeCredentional(name, age, gender);
  }
}
