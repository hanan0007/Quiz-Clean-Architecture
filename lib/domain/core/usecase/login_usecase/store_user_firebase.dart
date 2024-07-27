import 'package:quiz_clean_archi/domain/core/interfaces/login_interface/login_repository.dart';
import 'package:quiz_clean_archi/infrastructure/dal/models/user_model/user_model.dart';

class StoreUserFirebaseUsecase {
  final LoginRepository loginRepository;
  StoreUserFirebaseUsecase(this.loginRepository);
  execute(UserModel model) {
    return loginRepository.storeUsertoDb(model);
  }
}
