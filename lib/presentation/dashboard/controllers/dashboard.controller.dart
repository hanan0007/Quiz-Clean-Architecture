// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import 'package:quiz_clean_archi/domain/core/usecase/dashboard_usecase/launch_email.dart';
import 'package:quiz_clean_archi/domain/core/usecase/splash_usecase/read_user_usecase.dart';
import 'package:quiz_clean_archi/infrastructure/dal/models/user_model/user_model.dart';

class DashboardController extends GetxController {
  final LaunchEmailUseCase launchEmail;
  final ReadUserUsecase readUserUsecase;
  DashboardController(this.launchEmail, this.readUserUsecase);
  emaillaunch() {
    launchEmail.executeMail();
  }

  shareApp() {
    launchEmail.executeshare();
  }

  readUserCredentional() async {
    Map<String, dynamic> data = await readUserUsecase.execute();
    name = data['name'];
    age = data['age'];
    gender = data['gender'];
    update();
  }

  var user = UserModel(id: '', name: '', age: '', gender: '').obs;
  var isLoading = true.obs;
  String name = '';
  String age = '';
  String gender = '';
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    readUserCredentional();
  }
}
