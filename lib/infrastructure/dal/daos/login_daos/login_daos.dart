// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:quiz_clean_archi/domain/core/interfaces/login_interface/login_repository.dart';
import 'package:quiz_clean_archi/infrastructure/dal/models/user_model/user_model.dart';
import 'package:quiz_clean_archi/infrastructure/dal/services/db/database_service.dart';
import 'package:quiz_clean_archi/infrastructure/navigation/routes.dart';

class LoginDaos implements LoginRepository {
  final FirebaseService firebaseService;
  LoginDaos(
    this.firebaseService,
  );
  @override
  writeCredentional(String name, String age, String gender) async {
    GetStorage getStorage = GetStorage();
    getStorage.write("name", name);
    getStorage.write("age", age);
    getStorage.write("gender", gender);
  }

  @override
  Future<void> storeUsertoDb(UserModel model) {
    return firebaseService.addUser(model);
  }
}
