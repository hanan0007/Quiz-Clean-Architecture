import 'package:quiz_clean_archi/infrastructure/dal/models/user_model/user_model.dart';

abstract class LoginRepository {
  writeCredentional(String name, String age, String gender);
  Future<void> storeUsertoDb(UserModel model);
}
