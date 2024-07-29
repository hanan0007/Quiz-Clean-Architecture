// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:quiz_clean_archi/domain/core/usecase/dashboard_usecase/check_appversion.dart';

import 'package:quiz_clean_archi/domain/core/usecase/dashboard_usecase/launch_email.dart';
import 'package:quiz_clean_archi/domain/core/usecase/dashboard_usecase/userscore.dart';
import 'package:quiz_clean_archi/domain/core/usecase/splash_usecase/read_user_usecase.dart';
import 'package:quiz_clean_archi/infrastructure/dal/models/user_model/user_model.dart';
import 'package:quiz_clean_archi/presentation/dashboard/app_version.dart';

class DashboardController extends GetxController {
  final LaunchEmailUseCase launchEmail;
  final ReadUserUsecase readUserUsecase;
  final CheckAppversionUseCase checkAppversion;

  final UserscoreUsecase userscoreUsecase;
  DashboardController(this.launchEmail, this.readUserUsecase,
      this.checkAppversion, this.userscoreUsecase);
  // variables
  var user = UserModel(id: '', name: '', age: '', gender: '').obs;
  var isLoading = true.obs;
  String name = '';
  String age = '';
  String gender = '';
  // launch email
  emaillaunch() {
    launchEmail.executeMail();
  }

// share app
  shareApp() {
    launchEmail.executeshare();
  }

// check app version
  readAppversion() {
    checkAppversion.execute().then((version) {
      if (version != null) {
        if (version == '1') {
        } else {
          AppVersionConfermation.showAppversionConfirmationDialog(Get.context!);
        }
      } else {}
    }).catchError((error) {});
  }

// read user who
  readUserCredentional() async {
    Map<String, dynamic> data = await readUserUsecase.execute();
    name = data['name'];
    age = data['age'];
    gender = data['gender'];
    update();
  }

  // userscore
  streamUserscore() {
    userscoreUsecase.execute().listen((snapshot) {
      if (snapshot.exists) {
        user.value = UserModel.fromMap(snapshot.data()!);
        calculateScore();
        calculateCompletion();
      }
      isLoading.value = false;
    });
  }

// Calculate score in points
  RxString calculatescore = '0'.obs;
  int calculateScore() {
    int score = user.value.correct * 10 - user.value.wrong * 5;
    calculatescore.value = score.toString();
    return score;
  }

  // Calculate completion percentage
  RxString calculatecompletion = '0'.obs;
  String calculateCompletion() {
    if (user.value.totalquestion == 0) return '0%';
    double completion = (user.value.totalquestion / 100.0) * 100;
    String com = '${completion.toStringAsFixed(1)}%';
    calculatecompletion.value = com;
    return com;
  }

  @override
  void onInit() {
    super.onInit();
    readUserCredentional();
    readAppversion();
    streamUserscore();
  }
}
