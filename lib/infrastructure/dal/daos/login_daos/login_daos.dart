import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quiz_clean_archi/domain/core/interfaces/login_interface/login_repository.dart';
import 'package:quiz_clean_archi/infrastructure/navigation/routes.dart';

class LoginDaos implements LoginRepository {
  @override
  writeCredentional(String name, String age, String gender) async {
    GetStorage getStorage = GetStorage();
    getStorage.write("name", name);
    getStorage.write("age", age);
    getStorage.write("gender", gender);
  }
}
